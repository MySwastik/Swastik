import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sign/SignInPage/services.dart';
import 'GlowAvtar.dart';
import 'PlatformExceptionAlertDialog.dart';
import 'SignInEmailForm.dart';
import 'SocialSignInButton.dart';
import 'delayed_animation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExeptionAlertDialog(
      title: 'Sign in faild',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Swastik'),
        centerTitle: true,
        backgroundColor: Colors.orange[900],
      ),*/
      body: Container(
          decoration: BoxDecoration(
              color: Colors.deepOrange,
          ),
          child: Center(
              child: _buildContent(context)
          )
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DelayedAnimation(
                delay: 100,
                child: AvatarGlow(
                  endRadius: 100,
                  duration: Duration(seconds: 2),
                  glowColor:Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Image.asset('assets/circle-cropped.png',
                        fit: BoxFit.fill,
                        ),
                        radius: 50.0,
                      )),
                ),

              ),
              SizedBox(height: 40, child: DelayedAnimation(delay:300,child: _buildHeader())),
              SizedBox(
                height: 8,
              ),
              DelayedAnimation(
                child: Card(
                    borderOnForeground: true,
                    elevation: 10,
                    child: EmailSignInForm()),
                delay: 300,
              ),
              SizedBox(
                height: 8,
              ),
              DelayedAnimation(delay:500,child: Text('Or',
                style: TextStyle(color: Colors.white,fontSize: 18),
              )),
              SizedBox(height: 8),
              DelayedAnimation(
                child: SocialSignInButton(
                  imageAsset: 'assets/google-logo.png',
                  text: 'Sign in with Google',
                  textColor: Colors.black87,
                  color: Colors.white,
                  height: 50.0,
                  onPressed: _isLoading ? null : () => _signInWithGoogle(context),
                ),
                delay: 1000,
              ),


             /* DelayedAnimation(
                child: SignInButton(
                  text: 'Go Anonymous',
                  textColor: Colors.black,
                  color: Colors.lime[300],
                  height: 50.0,
                  onPressed: _isLoading ? null : () => _signInAnonymously(context),
                ),
                delay: 2000,
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    );
  }
}
