import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';

class RenameTeamBottomSheetWidget extends StatefulWidget {
  final List<TeamItem> teams;
  final int teamIndex;

  const RenameTeamBottomSheetWidget(
      {Key? key, required this.teams, required this.teamIndex})
      : super(key: key);

  @override
  _RenameTeamBottomSheetWidgetState createState() =>
      _RenameTeamBottomSheetWidgetState();
}

class _RenameTeamBottomSheetWidgetState
    extends State<RenameTeamBottomSheetWidget> {
  final TextEditingController _editingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TeamItem _team;
  late String _teamName;

  @override
  void initState() {
    super.initState();
    _team = widget.teams[widget.teamIndex];

    _teamName = _team.teamName ?? Strings.team + " ${_team.teamNumber ?? 1}";
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              MediaQuery.of(context).viewInsets + const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (Strings.rename + " " + _teamName).toUpperCase(),
                style: kDialogTitleTextStyle,
              ),
              TextFormField(
                controller: _editingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.validateEmptyTeamName;
                  } else if (widget.teams.any(
                      (team) => team.teamName == _editingController.text)) {
                    return Strings.validateTeamNameExists;
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: Strings.typeTeamNameHint,
                  hintStyle: kHintTextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(Strings.cancel),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _renameTeam,
                    child: const Text(Strings.rename),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _renameTeam() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<TeamsCubit>().renameTeam(
            teams: widget.teams,
            teamIndex: widget.teamIndex,
            newTeamName: _editingController.text,
          );
      Navigator.pop(context);
    }
  }
}
