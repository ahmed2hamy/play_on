import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/presentation/widgets/sentiment_widget.dart';
import 'package:play_on_task/features/teams/presentation/widgets/player_team_abbreviation_widget.dart';

class PlayerCardWidget extends StatelessWidget {
  final Player player;

  const PlayerCardWidget({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isConstructor = player.position == Position.constructor;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.topRight,
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: PlayerTeamAbbreviationWidget(player: player),
                      ),
                      isConstructor
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: CachedNetworkImage(
                                imageUrl: player.profileImage?.url ??
                                    kNetworkImagePlaceholder,
                                height: 30,
                                width: 75,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl: player.profileImage?.url ??
                                  kNetworkImagePlaceholder,
                              height: 50,
                              width: 50,
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        player.displayName ?? "",
                        style: kSmallBigWeightTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        positionAbbreviationValues
                                .reverse[player.positionAbbreviation] ??
                            "DR",
                        style: kPlayerPositionTextStyle,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kBorderColor),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.dumZeroMil,
                                    style:
                                        kSmallTextStyle.copyWith(fontSize: 8.0),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_up,
                                    color: kSecondaryColor,
                                    size: 6.0,
                                  ),
                                  Text(
                                    Strings.dumZeroMil,
                                    style: kSmallGreenTextStyle.copyWith(
                                        fontSize: 8.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            SentimentWidget(player: player),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
