import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/theme.helper.dart';
import '../gameList/gameList.controller.dart';
import '../models/game.model.dart';

class GameDetail extends StatelessWidget {
  GameListController controller = Get.put(GameListController());
  Game game;
  final tabIndex = 0.obs;
  GameDetail(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => gameDetail(game);

  gameDetail(Game game) async {
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
}
