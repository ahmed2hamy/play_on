import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/ui/helpers/app_navigator.dart';
import 'package:play_on_task/core/ui/widgets/app_loading_widget.dart';
import 'package:play_on_task/core/ui/widgets/dialogs.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/presentation/manager/players_cubit.dart';
import 'package:play_on_task/features/players/presentation/pages/players_screen.dart';
import 'package:play_on_task/features/teams/domain/entities/team_item.dart';
import 'package:play_on_task/features/teams/presentation/widgets/create_new_team_button.dart';
import 'package:play_on_task/features/teams/presentation/widgets/team_widget.dart';

const int _teamsMaxCount = 3;

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _textEditingController = TextEditingController();
  int _teamIndex = 0;
  final List<TeamItem> _teams = [];
  List<Player> _allPlayers = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<PlayersCubit>().getPlayers();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(kMicroLogoSvg),
            const SizedBox(width: 5),
            const Text(Strings.teams),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => AppNavigator.pushTo(
              context,
              widget: const PlayersScreen(),
            ),
            icon: const Icon(Icons.menu_outlined),
          ),
        ],
      ),
      backgroundColor: kTeamsScreenBackgroundColor,
      body: BlocConsumer<PlayersCubit, PlayersState>(
        listener: (context, state) {
          if (state is PlayersErrorState) {
            Dialogs.buildSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is PlayersLoadingState) {
            return const AppLoadingWidget();
          } else if (state is PlayersLoadedState) {
            _allPlayers = state.playersModel.players ?? [];
            return PageView.builder(
              itemCount: _getTeamsCount(),
              itemBuilder: (context, index) {
                if (_isCreateTeamIndex(index)) {
                  return CreateNewTeamButton(
                    teamNumber: _teamIndex + 1,
                    addNewTeam: _addNewTeam,
                  );
                }

                return TeamWidget(team: _teams[index]);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  int _getTeamsCount() {
    return _teamIndex > _teamsMaxCount - 1 ? _teamsMaxCount : _teamIndex + 1;
  }

  bool _isCreateTeamIndex(int index) {
    return index == _teamIndex && index <= _teamsMaxCount - 1;
  }

  void _addNewTeam() {
    _manipulatePlayersLists(_teamIndex + 1, _allPlayers);
    setState(() {
      _teamIndex = _teamIndex + 1;
    });
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
        constructor: randomConstructor);
    _teams.add(team);
  }
}
