import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/generated/l10n.dart';

class AlertDialogDone extends StatelessWidget {
  AlertDialogDone({
    super.key,
  });

  final AudioPlayer audioPlayer2 = AudioPlayer();

  void startSound() async {
    await audioPlayer2.setAsset('assets/audio/finish_sound.mp3');
    await audioPlayer2.setLoopMode(LoopMode.off);
    audioPlayer2.play();
  }

  @override
  Widget build(BuildContext context) {
    startSound();
    return AlertDialog(
      backgroundColor: transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        padding: const EdgeInsets.all(5),
        height: 220,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // close btn
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: grey,
                  size: 30,
                ),
              ),
            ),

            Icon(
              Icons.check_circle_outline_rounded,
              color: green,
              size: 70,
              weight: 2.2,
            ),

            Text(
              S.of(context).done,
              style: const TextStyle(
                fontSize: 35,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
