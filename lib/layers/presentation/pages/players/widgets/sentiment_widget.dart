import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';

class SentimentWidget extends StatelessWidget {
  const SentimentWidget({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

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
          player.isPositiveSentiment
              ? Container(
                  height: 4,
                  width: 16, //Todo: turn to percentage
                  margin: const EdgeInsets.only(left: 25),
                  color: kSecondaryColor,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
