import 'package:free2play/app/modules/gameList/gameList.repository.dart';
import 'package:free2play/app/modules/models/game.model.dart';
import 'package:get/get.dart';

class GameListController extends GetxController {
  GameListRepository repository = GameListRepository();
  Future<List<Game>> gameList() async => await repository.getGameList();
}
