import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

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
          "${Strings.createTeam} $teamNumber",
          style: kWhiteTextStyle,
        ),
      ),
    );
  }
}
