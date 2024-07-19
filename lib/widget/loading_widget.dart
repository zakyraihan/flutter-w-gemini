import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadingWidget(context) {
  return Center(
    child: Lottie.asset(
      'assets/Animation - 1719824079955.json',
      height: MediaQuery.of(context).size.height * 0.1,
    ),
  );
}
