import 'dart:math';

import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';
import 'package:play_on_task/layers/domain/entities/team_item.dart';
import 'package:play_on_task/layers/presentation/pages/teams/widgets/create_new_team_button.dart';
import 'package:play_on_task/layers/presentation/pages/teams/widgets/team_widget.dart';

class PlayersLoadedStateWidget extends StatefulWidget {
  final List<Player> allPlayers;

  const PlayersLoadedStateWidget({
    Key? key,
    required this.allPlayers,
  }) : super(key: key);

  @override
  State<PlayersLoadedStateWidget> createState() =>
      _PlayersLoadedStateWidgetState();
}

class _PlayersLoadedStateWidgetState extends State<PlayersLoadedStateWidget> {
  final List<TeamItem> _teams = [];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: _getTeamsCount(),
      itemBuilder: (context, index) {
        if (_isCreateTeamIndex(index)) {
          return CreateNewTeamButton(
            teamNumber: _teams.length + 1,
            addNewTeam: _addNewTeam,
          );
        }

        return TeamWidget(team: _teams[index]);
      },
    );
  }

  int _getTeamsCount() {
    return _teams.length > teamsMaxCount - 1
        ? teamsMaxCount
        : _teams.length + 1;
  }

  bool _isCreateTeamIndex(int index) {
    return index == _teams.length && index <= teamsMaxCount - 1;
  }

  void _addNewTeam() {
    _manipulatePlayersLists(_teams.length + 1, widget.allPlayers);
    setState(() {});
  }

  void _manipulatePlayersLists(int teamNumber, List<Player> players) {
    final List<Player> _drivers =
        players.where((e) => e.position == Position.driver).toList();

    final List<Player> _constructors =
        players.where((e) => e.position == Position.constructor).toList();

    List<Player> randomDrivers = List.generate(
      5,
      (_) {
        Player player = _drivers[Random().nextInt(_drivers.length)];
        _drivers.remove(player);
        return player;
      },
    );

    Player randomConstructor =
        _constructors[Random().nextInt(_constructors.length)];

    TeamItem team = TeamItem(
      teamNumber: teamNumber,
      drivers: randomDrivers,
      constructor: randomConstructor,
    );

    _teams.add(team);
  }
}
