import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arzu_chat/constants.dart';
import 'package:arzu_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //----------------- ANIMATION START with SingleTickerProviderStateMixin ----------------- //

  late AnimationController controller; // without "late", animation doesn't work
  late Animation animation; // without "late", animation doesn't work

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.black).animate(
        controller); // Use the animate() method of the AnimationController

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //----------------- ANIMATION END -----------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value, //animation
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Arzu Chat',
                      textStyle: kTextStyle,
                      colors: kColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/login_screen');
              },
            ),
            RoundedButton(
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, '/registration_screen');
                }),
          ],
        ),
      ),
    );
  }
}
