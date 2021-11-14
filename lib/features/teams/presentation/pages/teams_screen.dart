import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final int _teamNumber = 1;
  final List<Player> _players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(kMicroLogoSvg),
            const Text(Strings.teams),
          ],
        ),
      ),
      backgroundColor: kTeamsScreenBackgroundColor,
      body: PageView.builder(
        itemCount: _players.length + 1,
        itemBuilder: (context, index) {
          if (index == _players.length) {
            return CreateNewTeamButton(teamNumber: _teamNumber);
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: [
                  PlayerCard(player: _players[index]),
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
  const PlayerCard({
    Key? key,
    required Player player,
  })  : _player = player,
        super(key: key);

  final Player _player;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(_player.profileImage?.url ?? kNetworkImagePlaceholder),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class CreateNewTeamButton extends StatelessWidget {
  const CreateNewTeamButton({
    Key? key,
    required int teamNumber,
  })  : _teamNumber = teamNumber,
        super(key: key);

  final int _teamNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        style: kTextButtonStyle,
        child: Text(
          Strings.createTeam + " " + _teamNumber.toString(),
          style: kWhiteTextStyle,
        ),
      ),
    );
  }
}
