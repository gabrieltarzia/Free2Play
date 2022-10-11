import 'package:get/get.dart';
import '../models/game.model.dart';

class GameListRepository extends GetConnect {
  Future<List<Game>> getGameList() async {
    List<Game> gameList = [];

    var path = 'https://www.freetogame.com/api/games';

    final response = await get(path);

    final games = response.body;

    for (Map game in games) {
      Game g = Game.fromJson(game);
      gameList.add(g);
    }
    return gameList;
  }
}
