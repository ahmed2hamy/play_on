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
          cursorColor: Theme.of(context).colorScheme.secondary,
          decoration: InputDecoration(
            focusColor: Theme.of(context).colorScheme.secondary,
            hoverColor: Theme.of(context).colorScheme.secondary,
            hintText: Strings.search,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.secondary,
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
