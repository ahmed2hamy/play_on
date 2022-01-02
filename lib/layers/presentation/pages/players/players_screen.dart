import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/layers/presentation/manager/players_cubit.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/bottom_details_bar.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/budget_widget.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/go_up_the_list_fab.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/players_screen_body_widget.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/search_bar.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/separator.dart';
import 'package:play_on_task/layers/presentation/pages/players/widgets/sort_results_widget.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  final ScrollController _listController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<PlayersCubit>().getPlayers();
  }

  @override
  void dispose() {
    _listController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.selectPlayer,
          style: kTitleTextStyle,
        ),
        actions: _buildAppBarActions(),
      ),
      body: Column(
        children: [
          _isSearch
              ? SearchBar(searchController: _searchController)
              : const SizedBox(),
          const BudgetWidget(),
          const Separator(height: 0.5),
          Expanded(
            child: Stack(
              children: [
                PlayersScreenBodyWidget(listController: _listController),
                const SortResultsWidget(),
              ],
            ),
          ),
          const Separator(height: 0.5),
          const BottomDetailsBar(),
        ],
      ),
      floatingActionButton: GoUpTheListFAB(listController: _listController),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        onPressed: () {
          setState(() {
            _isSearch = !_isSearch;
          });
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.star_border),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.filter_alt_outlined),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.info_outline),
      ),
    ];
  }
}
