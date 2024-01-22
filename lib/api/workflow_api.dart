import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> makeWorkflowApiRequest(String userMessage) async {
  String apiUrl = "${dotenv.env['URL_CLARIFAI_WORKFLOW']}";
  String apiKey = "${dotenv.env['API_KEY_CLARIFAI']}";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {
            "raw":
                '$userMessage\nFor the person having the above criteria, calculate the total calories and nutrition he needs and then provide a full diet plan with a proper amount distribution in grams. The essential needs of nutrition should be considered importantly which consists vitamins, minerals etc beside than protien, carbs and fat. Location specific foods should be considered in diet only if they are really helpful in mainting goal and nutrition.'
          },
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
