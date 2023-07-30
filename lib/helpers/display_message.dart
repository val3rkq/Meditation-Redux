import 'package:flutter/material.dart';
import 'package:meditation_fox/constants.dart';

void displayMessage(BuildContext context, String text, {int time = 1}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: white,
      content: Text(
        text,
        style: TextStyle(color: black),
      ),
      duration: Duration(seconds: time),
    ),
  );
}