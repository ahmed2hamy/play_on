import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

class BudgetWidget extends StatelessWidget {
  const BudgetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                Strings.budget,
                style: kSmallTextStyle,
              ),
              Text(
                Strings.dumZeroMil,
                style: kSmallTextStyle,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: const LinearProgressIndicator(
              value: 0.6,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
