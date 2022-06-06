import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/actions_menu_item.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/players_column_widget.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/rename_team_bottom_sheet_widget.dart';

class TeamWidget extends StatelessWidget {
  final List<TeamItem> teams;
  final int teamIndex;

  const TeamWidget({Key? key, required this.teams, required this.teamIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamItem team = teams[teamIndex];

    List<ActionsMenuItem> popupMenuItems = const [
      ActionsMenuItem(
        title: Strings.rename,
        iconData: Icons.edit_outlined,
      ),
      ActionsMenuItem(
        title: Strings.recreate,
        iconData: Icons.refresh_outlined,
      ),
      ActionsMenuItem(
        title: Strings.replicate,
        iconData: Icons.content_copy_outlined,
      ),
      ActionsMenuItem(
        title: Strings.delete,
        iconData: Icons.delete_outline,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
      child: SingleChildScrollView(
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "T${team.teamNumber}",
                        style: kKanitTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          team.teamName ??
                              Strings.team + team.teamNumber.toString(),
                          style: kMediumTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              PlayersColumnWidget(
                drivers: team.drivers ?? [],
                constructor: team.constructor,
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
                child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  child: PopupMenuButton<int>(
                    icon: const Icon(Icons.more_vert_outlined),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: kBlankColor),
                    ),
                    elevation: 4,
                    onSelected: (v) => _onPopupMenuItemSelected(context, v),
                    itemBuilder: (context) => popupMenuItems
                        .map(
                          (e) => PopupMenuItem<int>(
                            value: popupMenuItems.indexOf(e),
                            child: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPopupMenuItemSelected(BuildContext context, int value) {
    if (value == 0) {
      _renameTeam(context);
    } else if (value == 1) {
      _recreateTeam();
    } else if (value == 2) {
      _replicateTeam();
    } else if (value == 3) {
      _deleteTeam();
    }
  }

  void _renameTeam(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          RenameTeamBottomSheetWidget(teams: teams, teamIndex: teamIndex),
    );
  }

  void _recreateTeam() {}

  void _replicateTeam() {}

  void _deleteTeam() {}
}
