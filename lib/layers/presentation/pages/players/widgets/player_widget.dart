import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/data/models/players_model.dart';
import 'package:play_on/layers/presentation/pages/players/widgets/plus_button.dart';
import 'package:play_on/layers/presentation/pages/players/widgets/rating_bar_widget.dart';
import 'package:play_on/layers/presentation/pages/players/widgets/sentiment_widget.dart';

class PlayerWidget extends StatelessWidget {
  final Player player;

  const PlayerWidget({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeadingWidget(),
          _buildBodyWidget(),
          _buildTrailingWidget(context),
        ],
      ),
    );
  }

  Widget _buildLeadingWidget() {
    return CircleAvatar(
      radius: 38,
      child: CachedNetworkImage(
          imageUrl: player.profileImage?.url ?? kNetworkImagePlaceholder),
    );
  }

  Widget _buildBodyWidget() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star_border),
              ),
              Text(
                positionAbbreviationValues
                        .reverse[player.positionAbbreviation] ??
                    "DR",
                style: kPlayerPositionTextStyle,
              ),
              const SizedBox(width: 5),
              Text(player.displayName ?? ""),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      Strings.q,
                      style: kSmallTextStyle,
                    ),
                    SizedBox(width: 1),
                    RatingBarWidget(),
                    SizedBox(width: 20),
                    Text(
                      Strings.r,
                      style: kSmallTextStyle,
                    ),
                    SizedBox(width: 1),
                    RatingBarWidget(),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Text(
                      Strings.dumPercent,
                      style: kSmallTextStyle,
                    ),
                    SizedBox(width: 20),
                    Text(
                      Strings.dumPoints,
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrailingWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: kBorderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                Strings.dumZeroMil,
                style: kSmallTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_up,
                      color: Theme.of(context).colorScheme.secondary),
                  const Text(
                    Strings.dumZeroMil,
                    style: kSmallGreenTextStyle,
                  ),
                ],
              ),
              SentimentWidget(player: player),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const PlusButton(),
      ],
    );
  }
}
