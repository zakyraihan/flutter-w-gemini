import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  var isLoading = false.obs;
  final textController = TextEditingController();

  sendMessage() async {
    if (textController.text.trim().isNotEmpty) {
      isLoading.value = true;
      var userMessage = textController.text.trim();
      messages.add(Message(text: userMessage, isUser: true));
      textController.clear();

      try {
        // The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
        final model = GenerativeModel(
            model: 'gemini-1.5-flash',
            apiKey: "AIzaSyBP-7bMwq9_lDTHmLHyOKNryMxYXzuBMVA");
        final content = [
          Content.text(userMessage)
        ]; // konten yang akan muncul ketika di ketik
        final response =
            await model.generateContent(content); // memunculkan konten

        messages.add(Message(text: '${response.text}', isUser: false));
      } catch (e) {
        messages.add(Message(
            text: 'Error: Tidak dapat menampilkan Pesan dari AI',
            isUser: false));
      } finally {
        isLoading.value = false;
      }
    } else {}
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
