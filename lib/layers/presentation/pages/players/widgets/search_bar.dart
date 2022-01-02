import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const SearchBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: TextField(
          controller: searchController,
          cursorColor: kSecondaryColor,
          decoration: InputDecoration(
            focusColor: kSecondaryColor,
            hoverColor: kSecondaryColor,
            hintText: Strings.search,
            prefixIcon: const Icon(
              Icons.search,
              color: kSecondaryColor,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: kSecondaryColor,
              ),
            ),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
