import 'package:flutter/material.dart';
import 'package:sign/colors/light_colors.dart';

class Chat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor:LightColors.kLightYellow2,
        body: Center(
          child: Text("Chat"),
        )
    );
  }

}