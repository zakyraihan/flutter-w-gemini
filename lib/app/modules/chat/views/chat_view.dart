import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:generative_ai/widget/input_text_widget.dart';
import 'package:generative_ai/widget/loading_widget.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Generative AI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      final isUser = message.isUser;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: BubbleSpecialThree(
                            text: message.text,
                            color: isUser
                                ? const Color(0xFF1B97F3)
                                : const Color(0xFFE0E0E0),
                            tail: true,
                            isSender: isUser ? true : false,
                            textStyle: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // child: isUser
                        //     ?  BubbleSpecialThree(
                        //         text: message.text,
                        //         color: const Color(0xFF1B97F3),
                        //         tail: true,
                        //         textStyle: const TextStyle(
                        //             color: Colors.white, fontSize: 16),
                        //       )
                        //     :  BubbleSpecialThree(
                        //         text: message.text,
                        //         color: const Color(0xFF1B97F3),
                        //         tail: true,
                        //         textStyle: const TextStyle(
                        //             color: Colors.white, fontSize: 16),
                        //       ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(() => controller.isLoading.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loadingWidget(context),
                  )
                : const SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child:
                        inputTextWidget(controller: controller.textController),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: controller.sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
