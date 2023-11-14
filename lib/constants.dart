import 'package:flutter/material.dart';

class Constants {
  static Color kColorsGreen = Colors.green;

  static List<Widget> headerRow = [
    Row(children: [
      Icon(
        Icons.chat,
        color: Constants.kColorsGreen,
      ),
      const Text("Chat")
    ]),
    Row(children: [
      Icon(
        Icons.email,
        color: Constants.kColorsGreen,
      ),
      const Text("Email")
    ]),
    Row(children: [
      Icon(
        Icons.file_copy,
        color: Constants.kColorsGreen,
      ),
      const Text("Letter")
    ])
  ];
}
