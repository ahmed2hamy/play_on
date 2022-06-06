import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/layers/data/models/players_model.dart';

class SentimentWidget extends StatelessWidget {
  final Player? player;

  const SentimentWidget({
    Key? key,
    this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: kBlankColor,
      ),
      child: Row(
        children: [
          player?.isPositiveSentiment ?? false
              ? Container(
                  height: 4,
                  width: 16, //Todo: turn to percentage
                  margin: const EdgeInsets.only(left: 25),
                  color: Theme.of(context).colorScheme.secondary,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
