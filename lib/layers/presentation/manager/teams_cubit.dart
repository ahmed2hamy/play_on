import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:play_on/layers/data/models/players_model.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitialState());

  Future addNewTeam(int teamNumber, List<Player> allPlayers) async {
    emit(TeamsLoadingState());
    try {
      final TeamItem team = _manipulatePlayersLists(teamNumber, allPlayers);
      emit(TeamsLoadedState(team));
    } catch (e) {
      emit(TeamsErrorState(e.toString()));
    }
  }

  TeamItem _manipulatePlayersLists(int teamNumber, List<Player> players) {
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

    return team;
  }

  Future renameTeam({
    required List<TeamItem> teams,
    required int teamIndex,
    required String newTeamName,
  }) async {
    emit(TeamsLoadingState());
    try {
      TeamItem team = teams[teamIndex];
      team = team.copyWith(teamName: newTeamName);
      emit(TeamsLoadedState(team));
    } catch (e) {
      emit(TeamsErrorState(e.toString()));
    }
  }
}

abstract class TeamsState extends Equatable {
  const TeamsState();
}

class TeamsInitialState extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsLoadingState extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsLoadedState extends TeamsState {
  final TeamItem team;

  const TeamsLoadedState(this.team);

  @override
  List<Object> get props => [team];
}

class TeamsErrorState extends TeamsState {
  final String errorMessage;

  const TeamsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
