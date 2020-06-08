import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:sign/SignInPage/CustomButton.dart';
import 'package:sign/SignInPage/PlatformExceptionAlertDialog.dart';
import 'package:sign/SignInPage/SignInPage.dart';
import 'package:sign/SignInPage/services.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool _done=false;
  bool _auth=false;
  bool _accept=true;
  bool _isLoading = false;

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }
  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExeptionAlertDialog(
      title: 'Sign in faild!',
      exception: exception,
    ).show(context);
  }

  void _onIntroEnd(context) {
    _signInAnonymously(context);
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Easy Search",
              body:
              "Find your purohit with the easyest search",
              image: _buildImage('1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Easy Payment",
              body:
              "Felxible payments are available",
              image: _buildImage('2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Here we Go...",
              body:
              "Purohit on the way to your home",
              image: _buildImage('3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Terms and Condition",
              body: '',
              image: Image.asset('assets/images/4.gif'),
              footer: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      child: Text("Accepting this"),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SignInButton(_auth),
                      AcceptButton(_accept),
                      //SignUpButton(_auth)
                    ],
                  )
                ],
              ),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done: done(_done),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget AcceptButton(bool visible) {
    return Visibility(
      child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            _done=true;
                            _auth=true;
                            _accept=false;
                          });
                        },
                        child: Text( 'Accept', style: TextStyle(color: Colors.white),),
                        color: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
      visible: visible,
    );
  }
  // ignore: non_constant_identifier_names
  Widget SignInButton(bool visible) {
    return Visibility(
      child: CustomButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: (context) =>
                  SignInPage(),
            ),
          );
        },
        child: Text( 'Sign In', style: TextStyle(color: Colors.white),),
        color: Colors.orangeAccent,
        height: 50,
        borderRadius: 25,
      ),
      visible: visible,
    );
  }
  // ignore: non_constant_identifier_names
  Widget SignUpButton(bool visible) {
    return Visibility(
      child: RaisedButton(
        onPressed: (){
          setState(() {
            _done=true;
          });
        },
        child: Text( 'Sign Up', style: TextStyle(color: Colors.white),),
        color: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      visible: visible,
    );
  }

  Widget done(bool visible) {
    return Visibility(child: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
    visible: visible,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}