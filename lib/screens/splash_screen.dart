import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:insta/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 100,
            height: 100,
          ),
          Text("H U T",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: secondaryColor)),
          // TextLiquidFill(
          //   text: "H U T",
          //   boxBackgroundColor: Colors.red,
          //   boxHeight: 300.0,
          //   waveColor: primaryColor,
          //   textStyle: Theme.of(context)
          //       .textTheme
          //       .displayLarge!
          //       .copyWith(fontWeight: FontWeight.bold, color: secondaryColor),
          // ),
          const SizedBox(height: 16.0),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText("SRI LANKA PROPERTY APP",
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: secondaryColor),
                  speed: const Duration(milliseconds: 60)),
            ],
          ),
        ],
      )),
    );
  }
}
