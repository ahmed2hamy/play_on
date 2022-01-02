import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

class BottomDetailsBar extends StatelessWidget {
  const BottomDetailsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Row(
        children: [
          const Icon(Icons.keyboard_arrow_down),
          const SizedBox(
            width: 12.0,
          ),
          const Text(
            Strings.hideList,
            style: kMediumTextStyle,
          ),
          const Spacer(),
          const Text(
            Strings.toPick + ": ",
            style: kSmallLightWeightTextStyle,
          ),
          const Text(
            Strings.dumNum,
            style: kSmallBigWeightTextStyle,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            width: 1.0,
            height: 16.0,
            color: kBorderColor,
          ),
          const Text(
            Strings.average + ": ",
            style: kSmallLightWeightTextStyle,
          ),
          const Text(
            Strings.dumZeroMil,
            style: kSmallBigWeightTextStyle,
          ),
        ],
      ),
    );
  }
}
