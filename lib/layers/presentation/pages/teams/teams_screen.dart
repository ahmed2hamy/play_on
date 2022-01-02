import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/presentation/helpers/app_navigator.dart';
import 'package:play_on_task/core/presentation/widgets/app_loading_widget.dart';
import 'package:play_on_task/core/presentation/widgets/dialogs.dart';
import 'package:play_on_task/layers/presentation/manager/players_cubit.dart';
import 'package:play_on_task/layers/presentation/pages/players/players_screen.dart';
import 'package:play_on_task/layers/presentation/pages/teams/widgets/players_loaded_state_widget.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _textEditingController = TextEditingController();

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
            return PlayersLoadedStateWidget(
              allPlayers: state.playersModel.players ?? [],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
