import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> makeGptTtsApiRequest(String testToConvert) async {
  String apiUrl = "${dotenv.env['URL_CLARIFAI_TTS']}";
  String apiKey = "${dotenv.env['API_KEY_CLARIFAI']}";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {"raw": testToConvert},
        }
      }
    ],
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
      dynamic data = outputs[0]['data']['audio']['base64'];
      return data.toString();
    } else {
      // Error handling
      return ("API Request failed with status code: ${response.statusCode}");
    }
  } catch (e) {
    return ("API Request failed: $e");
  }
}
