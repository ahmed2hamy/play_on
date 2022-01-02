import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/presentation/helpers/app_navigator.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';
import 'package:play_on_task/layers/presentation/pages/players/players_screen.dart';
import 'package:play_on_task/layers/presentation/pages/teams/widgets/players_loaded_state_widget.dart';

class TeamsScreen extends StatefulWidget {
  final List<Player> allPlayers;

  const TeamsScreen({
    Key? key,
    required this.allPlayers,
  }) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

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
      body: PlayersLoadedStateWidget(
        allPlayers: widget.allPlayers,
      ),
    );
  }
}
