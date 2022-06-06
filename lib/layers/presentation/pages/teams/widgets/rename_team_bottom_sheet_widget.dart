import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';
import 'package:play_on/layers/presentation/manager/rename_team_submit_button_cubit.dart';
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';

class RenameTeamBottomSheetWidget extends StatefulWidget {
  final List<TeamItem> teams;
  final int teamIndex;

  const RenameTeamBottomSheetWidget(
      {Key? key, required this.teams, required this.teamIndex})
      : super(key: key);

  @override
  RenameTeamBottomSheetWidgetState createState() =>
      RenameTeamBottomSheetWidgetState();
}

class RenameTeamBottomSheetWidgetState
    extends State<RenameTeamBottomSheetWidget> {
  final TextEditingController _editingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TeamItem _team;

  @override
  void initState() {
    super.initState();
    _team = widget.teams[widget.teamIndex];
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
                ("${Strings.rename} ${_team.teamName ?? ""}").toUpperCase(),
                style: kDialogTitleTextStyle,
              ),
              TextFormField(
                controller: _editingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: Strings.typeTeamNameHint,
                  hintStyle: kHintTextStyle,
                  suffixIcon:
                      BlocBuilder<RenameTeamSubmitButtonCubit, RenameTeamState>(
                    builder: (context, state) {
                      return state is SubmitButtonDisabled
                          ? const SizedBox()
                          : Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.secondary,
                            );
                    },
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    context
                        .read<RenameTeamSubmitButtonCubit>()
                        .disableSubmitButton();

                    return Strings.validateEmptyTeamName;
                  } else if (widget.teams.any(
                      (team) => team.teamName == _editingController.text)) {
                    context
                        .read<RenameTeamSubmitButtonCubit>()
                        .disableSubmitButton();

                    return Strings.validateTeamNameExists;
                  }
                  BlocListener(listener: (context, state) {
                    if (state is SubmitButtonDisabled) {
                      context
                          .read<RenameTeamSubmitButtonCubit>()
                          .enableSubmitButton();
                    }
                  });

                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(Strings.cancel),
                  ),
                  const SizedBox(width: 10),
                  BlocBuilder<RenameTeamSubmitButtonCubit, RenameTeamState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            state is SubmitButtonDisabled ? null : _renameTeam,
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text(Strings.rename),
                      );
                    },
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
