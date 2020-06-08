import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.child,
    this.color,
    this.borderRadius: 2.0,
    this.onPressed,
    this.height,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 300,
      child: RaisedButton(
        child: child,
        color: color,
        disabledColor: color,
        disabledElevation: 0,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
