import 'package:play_on/layers/data/models/players_model.dart';

class TeamItem {
  final int? teamNumber;
  final String? teamName;
  final List<Player>? drivers;
  final Player? constructor;

  const TeamItem({
    this.teamNumber,
    this.teamName,
    this.drivers,
    this.constructor,
  });

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
