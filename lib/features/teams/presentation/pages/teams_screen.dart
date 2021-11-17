import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
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

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  int _teamNumber = 1;

  @override
  void initState() {
    super.initState();
    context.read<PlayersCubit>().getPlayers();
  }

  void _addNewTeam() {
    setState(() {
      _teamNumber = _teamNumber + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              AppNavigator.pushTo(
                context,
                widget: const PlayersScreen(),
              );
            },
            icon: const Icon(Icons.menu_outlined),
          ),
        ],
      ),
      backgroundColor: kTeamsScreenBackgroundColor,
      body: PageView.builder(
        itemCount: _teamNumber,
        itemBuilder: (context, index) {
          if (index == _teamNumber - 1) {
            return CreateNewTeamButton(
              teamNumber: _teamNumber,
              addNewTeam: _addNewTeam,
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "T${index + 1}",
                            style: kKanitTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 55,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocConsumer<PlayersCubit, PlayersState>(
                    listener: (context, state) {
                      if (state is PlayersErrorState) {
                        Dialogs.buildSnackBar(context, state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      if (state is PlayersLoadingState) {
                        return const AppLoadingWidget();
                      } else if (state is PlayersLoadedState) {
                        List<Player> players = state.playersModel.players ?? [];

                        final List<Player> drivers = players
                            .where((e) => e.position == Position.driver)
                            .toList();

                        final List<Player> constructors = players
                            .where((e) => e.position == Position.constructor)
                            .toList();

                        final List<Player> randomDrivers = List.generate(
                          5,
                          (_) => drivers[Random().nextInt(drivers.length)],
                        );

                        final Player constructor =
                            constructors[Random().nextInt(constructors.length)];

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) =>
                                    PlayerCard(player: randomDrivers[index]),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                2,
                                (index) => PlayerCard(
                                    player: randomDrivers[index + 3]),
                              ),
                            ),
                            PlayerCard(player: constructor),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  Container(
                    height: 55,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isConstructor = player.position == Position.constructor;

    double containerHeight = 70.0;
    double containerWidth = 70.0;

    double clipperHeight = 30.0;
    double clipperWidth = 45.0;

    double imageSize = 50.0;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(4.0)),
              child: ClipPath(
                clipper: PLayerWidgetClipper(),
                child: Container(
                  height: clipperHeight,
                  width: clipperWidth,
                  color: kTeamCardBackgroundColor,
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    player.teamAbbreviation ?? "",
                    style: kSmallWhiteTextStyle,
                  ),
                ),
              ),
            ),
            _isConstructor
                ? CachedNetworkImage(
                    imageUrl:
                        player.profileImage?.url ?? kNetworkImagePlaceholder,
                    height: clipperHeight + 10,
                    width: containerWidth,
                  )
                : CachedNetworkImage(
                    imageUrl:
                        player.profileImage?.url ?? kNetworkImagePlaceholder,
                    width: imageSize,
                    height: imageSize,
                  ),
          ],
        ),
      ),
    );
  }
}

class PLayerWidgetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(PLayerWidgetClipper oldClipper) => false;
}

class CreateNewTeamButton extends StatelessWidget {
  final int teamNumber;
  final void Function() addNewTeam;

  const CreateNewTeamButton({
    Key? key,
    required this.teamNumber,
    required this.addNewTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: addNewTeam,
        style: kTextButtonStyle,
        child: Text(
          Strings.createTeam + " $teamNumber",
          style: kWhiteTextStyle,
        ),
      ),
    );
  }
}
