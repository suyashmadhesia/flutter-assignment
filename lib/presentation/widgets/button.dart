import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.fontColor,
      required this.backgroundColor,
      required this.buttonName});

  final void Function() onPressed;
  final Color fontColor;
  final String buttonName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
              side: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Text(
            buttonName,
            style: TextStyle(color: fontColor),
          ),
        ));
  }
}
