import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/core/presentation/widgets/app_loading_widget.dart';
import 'package:play_on/core/presentation/widgets/dialogs.dart';
import 'package:play_on/layers/data/models/players_model.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/create_new_team_button.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/team_widget.dart';

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
    return BlocConsumer<TeamsCubit, TeamsState>(
      listener: (context, state) {
        if (state is TeamsErrorState) {
          Dialogs.buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is TeamsLoadingState) {
          return const AppLoadingWidget();
        } else if (state is TeamsLoadedState) {
          int teamIndex = _teams
              .indexWhere((team) => team.teamNumber == state.team.teamNumber);

          if (teamIndex >= 0 && _teams.length - 1 == teamIndex) {
            _teams[teamIndex] = state.team;
          } else {
            _teams.add(state.team);
          }
          return PageView.builder(
            itemCount: _getTeamsCount(),
            itemBuilder: (context, index) {
              if (_isCreateTeamIndex(index)) {
                return CreateNewTeamButton(
                  teamNumber: _teams.length + 1,
                  addNewTeam: _addNewTeam,
                );
              } else {
                return TeamWidget(teams: _teams, teamIndex: index);
              }
            },
          );
        } else {
          return CreateNewTeamButton(
            teamNumber: _teams.length + 1,
            addNewTeam: _addNewTeam,
          );
        }
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
    context.read<TeamsCubit>().addNewTeam(_teams.length + 1, widget.allPlayers);
  }
}
