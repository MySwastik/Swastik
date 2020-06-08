import 'package:flutter/material.dart';
import 'CustomButton.dart';

class SignInButton extends CustomButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
    double height,
  })  : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
          color: color,
          borderRadius: 25.0,
          height: height,
          onPressed: onPressed,
        );
}
