import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign/MainSection/bottom_bar.dart';
import 'package:sign/SignInPage/services.dart';
import 'package:sign/bmin1.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return MyCoolApp();
            }
            return MyHomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
