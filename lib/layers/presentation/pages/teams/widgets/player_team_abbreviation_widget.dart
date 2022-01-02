import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';
import 'package:play_on_task/layers/presentation/pages/teams/widgets/player_widget_clipper.dart';

class PlayerTeamAbbreviationWidget extends StatelessWidget {
  final Player player;

  const PlayerTeamAbbreviationWidget({Key? key, required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0)),
      child: ClipPath(
        clipper: PlayerWidgetClipper(),
        child: Container(
          height: 30.0,
          width: 45.0,
          color: kTeamCardBackgroundColor,
          padding: const EdgeInsets.all(5.0),
          child: Text(
            player.teamAbbreviation ?? "",
            style: kSmallWhiteTextStyle,
          ),
        ),
      ),
    );
  }
}
