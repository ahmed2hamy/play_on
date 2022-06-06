import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/data/models/players_model.dart';

class TeamItem {
  final int? teamNumber;
  String? teamName;
  final List<Player>? drivers;
  final Player? constructor;

  TeamItem({
    this.teamNumber,
    this.teamName,
    this.drivers,
    this.constructor,
  }) {
    teamName = "${Strings.team} ${teamNumber ?? 1}";
  }

  TeamItem copyWith({
    int? teamNumber,
    String? teamName,
    List<Player>? drivers,
    Player? constructor,
  }) {
    return TeamItem(
      teamNumber: teamNumber ?? this.teamNumber,
      teamName: teamName ?? this.teamName,
      drivers: drivers ?? this.drivers,
      constructor: constructor ?? this.constructor,
    );
  }
}
