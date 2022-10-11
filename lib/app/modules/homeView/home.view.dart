import 'package:flutter/material.dart';
import '../gameList/gameList.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Data by: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    Image.network(
                        'https://www.freetogame.com/assets/images/freetogame-logo.png'),
                  ],
                ),
              )),
          Expanded(flex: 16, child: GameListWidget())
        ],
      ),
    );
  }
}
