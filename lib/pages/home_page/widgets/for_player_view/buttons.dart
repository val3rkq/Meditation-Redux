import 'package:flutter/material.dart';
import 'package:meditation_fox/constants.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.onPreviousTrack,
    required this.onNextTrack,
  });

  final Function() onPreviousTrack;
  final Function() onNextTrack;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onPreviousTrack,
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 50,
              color: white,
            ),
          ),
          GestureDetector(
            onTap: onNextTrack,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 50,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
