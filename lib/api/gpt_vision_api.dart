import 'dart:convert';
import 'package:http/http.dart' as http;

void makeGptVisionApiRequest() async {
  const String apiUrl =
      "https://api.clarifai.com/v2/users/openai/apps/chat-completion/models/openai-gpt-4-vision/versions/266df29bc09843e0aee9b7bf723c03c2/outputs";
  const String apiKey = "82aea527de1a43f4a670ed0572920f62";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {"raw": "Write a very longdescription for the image "},
          "image": {"url": "https://samples.clarifai.com/metro-north.jpg"}
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
    print(data);
  } else {
    // Error handling
    print("API Request failed with status code ${response.statusCode}");
    print("Error response: ${response.body}");
  }
}
