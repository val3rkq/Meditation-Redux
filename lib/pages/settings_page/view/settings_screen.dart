import 'package:flutter/material.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/generated/l10n.dart';

import '../widgets/all.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: black,
      ),
      body: const Center(
        child: LottieWidget(),
      ),
    );
  }
}
