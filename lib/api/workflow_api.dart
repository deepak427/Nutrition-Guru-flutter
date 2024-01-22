import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> makeWorkflowApiRequest(String systemMessage) async {
  String apiUrl = "${dotenv.env['URL_CLARIFAI_WORKFLOW']}";
  String apiKey = "${dotenv.env['API_KEY_CLARIFAI']}";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {"raw": systemMessage},
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
      List<dynamic> results = jsonResponse['results'];
      dynamic outputs = results[0]['outputs'];
      dynamic data = outputs[1]['data']['text']['raw'];
      return data;
    } else {
      // Error handling
      return ("API Request failed with status code: ${response.statusCode}");
    }
  } catch (e) {
    return ("API Request failed: $e");
  }
}
