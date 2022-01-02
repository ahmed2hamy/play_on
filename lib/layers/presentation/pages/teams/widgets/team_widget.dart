import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/domain/entities/team_item.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/actions_menu_item.dart';
import 'package:play_on/layers/presentation/pages/teams/widgets/players_column_widget.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    Key? key,
    required TeamItem team,
  })  : _team = team,
        super(key: key);

  final TeamItem _team;

  @override
  Widget build(BuildContext context) {
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
                      "T" + _team.teamNumber.toString(),
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
                        Strings.team + _team.teamNumber.toString(),
                        style: kMediumTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PlayersColumnWidget(
              drivers: _team.drivers,
              constructor: _team.constructor,
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
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: kBlankColor),
                  ),
                  elevation: 4,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: _renameTeam,
                        child: const ActionsMenuItem(
                          title: Strings.rename,
                          iconData: Icons.edit_outlined,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: _recreateTeam,
                        child: const ActionsMenuItem(
                          title: Strings.recreate,
                          iconData: Icons.refresh_outlined,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: _replicateTeam,
                        child: const ActionsMenuItem(
                          title: Strings.replicate,
                          iconData: Icons.content_copy_outlined,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: _deleteTeam,
                        child: const ActionsMenuItem(
                          title: Strings.delete,
                          iconData: Icons.delete_outline,
                        ),
                      ),
                    ];
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _renameTeam() {}

  void _recreateTeam() {}

  void _replicateTeam() {}

  void _deleteTeam() {}
}
