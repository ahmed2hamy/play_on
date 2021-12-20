import 'package:flutter/material.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/teams/presentation/widgets/player_card_widget.dart';

class PlayersColumnWidget extends StatelessWidget {
  final List<Player> drivers;
  final Player constructor;

  const PlayersColumnWidget({
    Key? key,
    required this.drivers,
    required this.constructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => PlayerCardWidget(player: drivers[index]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (index) => PlayerCardWidget(player: drivers[index + 3]),
          ),
        ),
        PlayerCardWidget(player: constructor),
      ],
    );
  }
}
