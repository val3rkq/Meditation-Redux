import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_fox/constants.dart';

class FoxWidget extends StatefulWidget {
  const FoxWidget({super.key});

  @override
  State<FoxWidget> createState() => _FoxWidgetState();
}

class _FoxWidgetState extends State<FoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      curve: Curves.slowMiddle,
      endRadius: 200,
      duration: const Duration(seconds: 3),
      child:
      // lottie animation
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: transparent,
        ),
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.only(right: 20),
        child: Lottie.asset(
          'assets/animations/fox.json',
          height: 250,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
