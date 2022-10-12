import 'package:flutter/material.dart';
import 'package:free2play/app/helpers/theme.helper.dart';
import 'package:free2play/app/modules/gameList/gameList.controller.dart';
import 'package:get/get.dart';
import '../models/game.model.dart';

class GameCard extends StatelessWidget {
  Game game;
  GameListController gameController = Get.put(GameListController());
  final tabIndex = 0.obs;
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
              child: _gameThumbnail(game),
            ),
            Expanded(
              flex: 12,
              child: ListTile(
                onTap: (() => _gameDetail(game)),
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

  _gameDetail(Game game) async {
    final tabIndex = 0.obs;
    GameListController controller = Get.put(GameListController());
    game = await controller.gameDetails(game.id!);
    return Get.defaultDialog(
        title: game.title.toString(),
        backgroundColor: Colors.white24,
        buttonColor: Colors.grey.shade800,
        cancelTextColor: Colors.grey.shade900,
        textCancel: 'Back',
        content: Column(children: [
          Obx(() => _cardContent(game)),
          _tabs(),
        ]),
        middleText: game.shortDescription.toString());
  }

  _tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => tabIndex.value = 0,
            child: const Card(
                color: Colors.white24,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ScreenShots', style: ThemeHelper.titleTextStyle),
                ))),
        GestureDetector(
          onTap: () => tabIndex.value = 1,
          child: const Card(
              color: Colors.white24,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Description', style: ThemeHelper.titleTextStyle),
              )),
        ),
        GestureDetector(
            onTap: () => tabIndex.value = 2,
            child: const Card(
                color: Colors.white24,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('System requirements',
                      style: ThemeHelper.titleTextStyle),
                ))),
      ],
    );
  }

  /*_cardContent(Game game) =>
      game.screenshots!.isNotEmpty ? _screenShots(game) : _gameThumbnail(game);*/

  _cardContent(Game game) {
    switch (tabIndex.value) {
      case 0:
        return _screenShots(game);

      case 1:
        return _gameDescription(game);

      case 2:
        return _requirements(game);

      default:
        return _screenShots(game);
    }
  }

  _gameDescription(Game game) => Center(
        child: Container(
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _publisherCard(game),
                  const Divider(),
                  Text(
                    game.description.toString(),
                    style: ThemeHelper.subtitleTextStyle,
                  ),
                ],
              ),
            )),
      );

  _requirements(Game game) {
    return game.minimumSystemRequirements != null
        ? Center(
            child: Container(
                color: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListTile(
                      title: const Center(
                          child: Text(
                        'System requirements',
                        style: ThemeHelper.titleTextStyle,
                      )),
                      subtitle: Column(children: [
                        ListTile(
                          title: const Text(
                            'Graphics',
                            style: ThemeHelper.titleTextStyle,
                          ),
                          subtitle: Text(
                            game.minimumSystemRequirements!.graphics.toString(),
                            style: ThemeHelper.subtitleTextStyle,
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Memory',
                            style: ThemeHelper.titleTextStyle,
                          ),
                          subtitle: Text(
                            game.minimumSystemRequirements!.memory.toString(),
                            style: ThemeHelper.subtitleTextStyle,
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'System',
                            style: ThemeHelper.titleTextStyle,
                          ),
                          subtitle: Text(
                            game.minimumSystemRequirements!.os.toString(),
                            style: ThemeHelper.subtitleTextStyle,
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            'Processor',
                            style: ThemeHelper.titleTextStyle,
                          ),
                          subtitle: Text(game
                              .minimumSystemRequirements!.processor
                              .toString()),
                        ),
                        ListTile(
                          title: const Text(
                            'Storage',
                            style: ThemeHelper.titleTextStyle,
                          ),
                          subtitle: Text(
                            game.minimumSystemRequirements!.storage.toString(),
                            style: ThemeHelper.subtitleTextStyle,
                          ),
                        ),
                      ])),
                )),
          )
        : Container(
            color: Colors.white60,
            child: const Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                    title: Center(
                        child: Text(
                      'Sorry',
                      style: ThemeHelper.titleTextStyle,
                    )),
                    subtitle: Text('No data found :('))));
  }

  _publisherCard(Game game) => Row(
        children: [
          Card(
              color: Colors.white24,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Developer: ${game.developer.toString()}',
                    style: ThemeHelper.titleTextStyle),
              )),
          Card(
              color: Colors.white24,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Publisher: ${game.publisher.toString()}',
                    style: ThemeHelper.titleTextStyle),
              ))
        ],
      );

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

  _screenShots(Game game) {
    final imageIndex = 0.obs;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Obx(() => Image.network(
              game.screenshots![imageIndex.value].image.toString(),
              height: 500,
              width: 1000,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : Container(
                          height: 500,
                          width: 1000,
                          color: Colors.black,
                          child: const CircularProgressIndicator()),
            )),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left,
              color: Colors.white,
            ),
            onPressed: () {
              imageIndex.value > 0
                  ? imageIndex.value--
                  : imageIndex.value = game.screenshots!.length - 1;
            },
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.arrow_circle_right, color: Colors.white),
            onPressed: () {
              imageIndex.value < game.screenshots!.length - 1
                  ? imageIndex.value++
                  : imageIndex.value = 0;
            },
          ),
        ),
        Obx(
          () => Text(
            '${imageIndex.value + 1} / ${game.screenshots!.length}',
            style: ThemeHelper.titleTextStyle,
          ),
        ),
      ],
    );
  }
}
