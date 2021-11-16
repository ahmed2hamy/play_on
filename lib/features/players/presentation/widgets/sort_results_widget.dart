import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';

class SortResultsWidget extends StatelessWidget {
  const SortResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  Strings.dumResultsFilter,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 1,
                  height: 36,
                  color: kBorderColor,
                ),
                const Icon(
                  Icons.sort,
                  size: 18.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
