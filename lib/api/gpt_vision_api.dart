import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> makeGptVisionApiRequest(
    String imageUrl, String systemMessage) async {
      
  String apiUrl = "${dotenv.env['URL_CLARIFAI']}";
  String apiKey = "${dotenv.env['API_KEY_CLARIFAI']}";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {"raw": systemMessage},
          "image": {"url": imageUrl}
        }
      }
    ],
    "model": {
      "model_version": {
        "output_info": {
          "params": {"temperature": 0.5, "max_tokens": 2048, "top_k": 0.95}
        }
      }
    }
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Key $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      // Successful response
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> outputs = jsonResponse['outputs'];
      dynamic data = outputs[0]['data']['text']['raw'];
      return data;
    } else {
      // Error handling
      return ("API Request failed with status code: ${response.statusCode}");
    }
  } catch (e) {
    return ("API Request failed: $e");
  }
}
