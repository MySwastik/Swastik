import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomButton.dart';

class FormSubmitButton extends CustomButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,

  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: Colors.orange[900],
          borderRadius: 25.0,
          onPressed: onPressed,
        );
}
