import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class AIService {
  Future<String> sendMessage(String message) async {
    try {
      // Using v1beta endpoint allows flexible access to both 1.5 and 2.5 models
      final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${AppConstants.apiKey}",
      );

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": message}
              ]
            }
          ]
        }),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Added safety checks to prevent null pointer exceptions if candidates are empty
        if (data["candidates"] != null && data["candidates"].isNotEmpty) {
          final firstCandidate = data["candidates"][0];
          if (firstCandidate["content"] != null && firstCandidate["content"]["parts"] != null) {
            return firstCandidate["content"]["parts"][0]["text"].toString();
          }
        }
        return "Error: Received empty response from model.";
      }

      if (response.statusCode == 404) {
        return "Model not found. Verify the model name and ensure you're using the correct endpoint version (v1beta).";
      }

      if (response.statusCode == 403) {
        return "API key invalid, restricted, or blocked.";
      }

      return "Error: ${response.statusCode}\n${response.body}";
    } catch (e) {
      return "Exception: $e";
    }
  }
}