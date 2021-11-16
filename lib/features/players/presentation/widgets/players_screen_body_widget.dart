import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on_task/core/ui/widgets/app_loading_widget.dart';
import 'package:play_on_task/core/ui/widgets/dialogs.dart';
import 'package:play_on_task/core/ui/widgets/separator.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/presentation/manager/players_cubit.dart';
import 'package:play_on_task/features/players/presentation/widgets/player_widget.dart';

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
