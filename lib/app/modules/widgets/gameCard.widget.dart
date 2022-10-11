import 'package:flutter/material.dart';
import 'package:free2play/app/helpers/theme.helper.dart';

import '../models/game.model.dart';

class GameCard extends StatelessWidget {
  Game game;

  GameCard(this.game);
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
              child: Image.network(
                game.thumbnail.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 12,
              child: ListTile(
                title: Text(game.title.toString(), style: ThemeHelper.titleTextStyle,),
                trailing: Card(
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(game.platform.toString()),
                    )),
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
}
