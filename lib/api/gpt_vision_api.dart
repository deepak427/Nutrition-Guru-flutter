import 'dart:convert';
import 'package:http/http.dart' as http;

void makeGptVisionApiRequest(String imageUrl) async {
  const String apiUrl =
      "https://api.clarifai.com/v2/users/openai/apps/chat-completion/models/openai-gpt-4-vision/versions/266df29bc09843e0aee9b7bf723c03c2/outputs";
  const String apiKey = "82aea527de1a43f4a670ed0572920f62";

  final Map<String, dynamic> requestData = {
    "inputs": [
      {
        "data": {
          "text": {
            "raw":
                "You are a nutritionist. You have knowledge of the effects of nutrients and ingredients in a product on health. You will be given an image of the nutritional information label. Output the benefits and losses of consuming that product. Also recommend how much of that product should be consumed per day."
          },
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
