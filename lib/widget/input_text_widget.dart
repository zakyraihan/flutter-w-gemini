import 'package:flutter/material.dart';

Widget inputTextWidget({controller}) {
  return TextField(
    controller: controller,
    decoration: const InputDecoration(
      hintText: 'Type your message here...',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  );
}
