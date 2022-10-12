import 'package:free2play/app/helpers/web.helper.dart';
import 'package:get/get.dart';
import '../models/game.model.dart';

class GameListRepository extends GetConnect {
  Future<List<Game>> getGameList() async {
    List<Game> gameList = [];

    var path = WebHelper.freeGamesApi;

    final response = await get(path);

    final games = response.body;

    for (Map game in games) {
      Game g = Game.fromJson(game);

      gameList.add(g);
    }
    return gameList;
  }

  Future<Game> getGameDetails(int? id) async {
    var path = WebHelper.freeGamesDestailApi + id.toString();

    final response = await get(path);

    final game = response.body;

    Game gameDetails = Game.fromJson(game);

    return gameDetails;
  }
}
