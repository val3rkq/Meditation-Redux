import 'package:flutter/material.dart';
import 'package:meditation_fox/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
    required this.isPause,
  });

  final Function()? onTap;
  final String name;
  final IconData? icon;
  final bool? isPause;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, isPause == null ? 20 : 10, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: white,
        ),
        child: icon == null
            ? Text(
                name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      icon,
                      size: 30,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
