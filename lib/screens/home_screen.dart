import 'package:flutter/material.dart';
import 'package:insta/widgets/card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CardItem(),
      ),
    );
  }
}
