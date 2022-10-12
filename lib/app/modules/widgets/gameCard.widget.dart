import 'package:flutter/material.dart';
import 'package:free2play/app/helpers/theme.helper.dart';
import 'package:free2play/app/modules/gameList/gameList.controller.dart';
import 'package:free2play/app/modules/widgets/gameDetail.widget.dart';
import 'package:get/get.dart';
import '../models/game.model.dart';

class GameCard extends StatelessWidget {
  Game game;
  GameListController gameController = Get.put(GameListController());
  final tabIndex = 0.obs;
  GameCard(this.game, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white10,
        shadowColor: Colors.white54,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius:
              const BorderRadius.horizontal(right: Radius.elliptical(100, 500)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: _gameThumbnail(game),
            ),
            Expanded(
              flex: 12,
              child: ListTile(
                onTap: (() => GameDetail(game).gameDetail(game)),
                title: Text(
                  game.title.toString(),
                  style: ThemeHelper.titleTextStyle,
                ),
                trailing: _platformCard(game),
                subtitle: Container(
                    height: 84,
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        game.shortDescription.toString(),
                        style: ThemeHelper.subtitleTextStyle,
                      ),
                    )),
                isThreeLine: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _gameThumbnail(Game game) => Image.network(
        game.thumbnail.toString(),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator());
        },
      );

  _platformCard(Game game) => Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(game.platform.toString()),
      ));
}
