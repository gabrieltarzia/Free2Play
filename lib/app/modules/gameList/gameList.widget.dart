import 'package:flutter/material.dart';
import 'package:free2play/app/modules/widgets/gameCard.widget.dart';
import 'package:get/get.dart';
import '../models/game.model.dart';
import 'gameList.controller.dart';

class GameListWidget extends StatelessWidget {
  final controller = Get.put(GameListController());
  GameListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: controller.gameList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LinearProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (snapshot.hasData) {
                final List<Game> game = snapshot.data as List<Game>;
                return ListView.builder(
                    itemCount: game.length,
                    itemBuilder: (context, index) {
                      return GameCard(game[index]);
                    });
              }
            }
            return const Center();
          }),
    );
  }
}
