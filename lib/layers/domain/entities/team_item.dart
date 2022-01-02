import 'package:play_on_task/layers/data/models/players_model.dart';

class TeamItem {
  final int teamNumber;
  final List<Player> drivers;
  final Player constructor;

  const TeamItem({
    required this.teamNumber,
    required this.drivers,
    required this.constructor,
  });
}