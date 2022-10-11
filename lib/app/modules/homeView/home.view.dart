import 'package:flutter/material.dart';
import '../gameList/gameList.widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: GameListWidget(),
    );
  }
}
