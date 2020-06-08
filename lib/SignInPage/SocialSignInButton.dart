import 'package:flutter/material.dart';
import 'CustomButton.dart';

class SocialSignInButton extends CustomButton {
  SocialSignInButton({
    @required String imageAsset,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
    double height,
  })  : assert(text != null, imageAsset != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(imageAsset),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                ),
              ),
              Opacity(opacity: 0.0, child: Image.asset(imageAsset)),
            ],
          ),
          color: color,
          borderRadius: 25.0,
          height: height,
          onPressed: onPressed,
        );
}
