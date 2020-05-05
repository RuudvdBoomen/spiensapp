import 'package:toep_app/objects/Game.dart';
import './player.dart';

class Toepen extends Game {
  final scoreChangedPlayers = Set();
  Toepen(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.toepenScore == 10) {
        return true;
      }
    }
    return false;
  }

  void updateScore(Player player, int change) {
    player.changeScoreBy(change);
    if (change > 0 && player.toepenScore < 10) scoreChangedPlayers.add(player);
    if (scoreChangedPlayers.length == (players.length - 1)) {
      scoreChangedPlayers.clear();
    }
  }
}
