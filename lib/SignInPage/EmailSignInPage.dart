import 'package:flutter/material.dart';
import 'SignInEmailForm.dart';
import 'delayed_animation.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.orange[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: DelayedAnimation(
            delay: 500,
            child: Card(
              borderOnForeground: true,
              elevation: 10,
                  child: EmailSignInForm()),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
