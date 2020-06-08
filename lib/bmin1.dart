import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign/Startup/info_page.dart';
import 'colors/light_colors.dart';



class MyCoolApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Swastik13",
      home: InfoPage(),
    );
  }
}