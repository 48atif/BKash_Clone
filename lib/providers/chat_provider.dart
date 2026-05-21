import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../services/ai_service.dart';

class ChatProvider extends ChangeNotifier {
  final AIService _aiService = AIService();

  final List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      role: "user",
      timestamp: DateTime.now(),
    );

    _messages.add(userMessage);

    _isLoading = true;
    notifyListeners();

    final aiResponse = await _aiService.sendMessage(text);

    final aiMessage = MessageModel(
      id: DateTime.now().toString(),
      text: aiResponse,
      role: "assistant",
      timestamp: DateTime.now(),
    );

    _messages.add(aiMessage);

    _isLoading = false;
    notifyListeners();
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}