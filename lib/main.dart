import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignInPage/LandingPage.dart';
import 'SignInPage/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Swastik',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: LandingPage(),
      ),
    );
  }
}
