import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_fox/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.focus,
    required this.controller,
    required this.changeFocus,
    required this.validateFunction,
    required this.hintText,
  });

  final TextEditingController controller;
  final FocusNode? focus;
  final Function()? changeFocus;
  final String? Function(String?)? validateFunction;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateFunction,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 2,
      controller: controller,
      autofocus: hintText == 'Seconds..',
      focusNode: focus,
      onFieldSubmitted: (value) {
        changeFocus!();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: hintText,
        hintStyle:
            TextStyle(color: grey6, fontWeight: FontWeight.w500, fontSize: 17),
        counterText: '',
        filled: true,
        fillColor: grey2,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: white)),
      ),
    );
  }
}
