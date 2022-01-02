import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on/core/presentation/widgets/app_loading_widget.dart';
import 'package:play_on/core/presentation/widgets/dialogs.dart';
import 'package:play_on/layers/data/models/players_model.dart';
import 'package:play_on/layers/presentation/manager/players_cubit.dart';
import 'package:play_on/layers/presentation/pages/players/widgets/player_widget.dart';
import 'package:play_on/layers/presentation/pages/players/widgets/separator.dart';

class PlayersScreenBodyWidget extends StatelessWidget {
  final ScrollController listController;

  const PlayersScreenBodyWidget({
    Key? key,
    required this.listController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayersCubit, PlayersState>(
      listener: (context, state) {
        if (state is PlayersErrorState) {
          Dialogs.buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PlayersLoadingState) {
          return const AppLoadingWidget();
        } else if (state is PlayersLoadedState) {
          List<Player?> players = state.playersModel.players ?? [];

          return ListView.separated(
              controller: listController,
              itemCount: players.length,
              separatorBuilder: (_, __) => const Separator(),
              itemBuilder: (_, index) {
                final Player? player = players[index];
                if (player != null) {
                  return PlayerWidget(player: player);
                } else {
                  return const SizedBox();
                }
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
