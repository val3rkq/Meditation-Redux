import 'package:flutter/material.dart';

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
            child: const Icon(
              Icons.keyboard_arrow_left,
              size: 50,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: onNextTrack,
            child: const Icon(
              Icons.keyboard_arrow_right,
              size: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
