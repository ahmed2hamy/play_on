import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/ui/widgets/app_loading_widget.dart';
import 'package:play_on_task/core/ui/widgets/dialogs.dart';
import 'package:play_on_task/core/ui/widgets/rating_bar_widget.dart';
import 'package:play_on_task/core/ui/widgets/separator.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/presentation/manager/players_cubit.dart';

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
        title: const Text(Strings.selectPlayer),
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
            _isSearch = true;
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
            hintText: 'Search',
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
            children: [
              const Text(
                'Budget',
                style: TextStyle(fontSize: 12.0),
              ),
              Row(
                children: const [
                  Text(
                    '\$00.0',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    'M',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: const LinearProgressIndicator(
              value: 0.2,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayersScreenBodyWidget extends StatelessWidget {
  final ScrollController listController;

  const PlayersScreenBodyWidget({
    Key? key,
    required this.listController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayersCubit, PlayersState>(
      listener: (context, state) {
        if (state is PlayersErrorState) {
          Dialogs.buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PlayersLoadingState) {
          return const AppLoadingWidget();
        } else if (state is PlayersLoadedState) {
          List<Player?> players = state.playersModel.players ?? [];

          return ListView.separated(
              controller: listController,
              itemCount: players.length,
              separatorBuilder: (_, __) => const Separator(),
              itemBuilder: (_, index) {
                final Player? player = players[index];
                if (player != null) {
                  return PlayerWidget(player: player);
                } else {
                  return const SizedBox();
                }
              });
        } else {
          return Container();
        }
      },
    );
  }
}

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
        children: [
          _buildLeadingWidget(),
          _buildBodyWidget(),
          _buildTrailingWidget(),
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
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
            ),
            Text(
              player.positionAbbreviation?.toUpperCase() ?? "",
              style: kPlayerPositionTextStyle,
            ),
            const SizedBox(width: 5),
            Text(
              player.displayName ?? "",
              style: kBlackTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text(
              Strings.q,
              style: kSmallBlackTextStyle,
            ),
            SizedBox(width: 1),
            RatingBarWidget(),
            SizedBox(width: 20),
            Text(
              Strings.r,
              style: kSmallBlackTextStyle,
            ),
            SizedBox(width: 1),
            RatingBarWidget(),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Text(
              "99.9%",
              style: kSmallBlackTextStyle,
            ),
            SizedBox(width: 20),
            Text(
              "0000 pts",
              style: kSmallBlackTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTrailingWidget() {
    return Row(
      children: const [],
    );
  }
}

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
                  '20 RESULTS SORTED BY NAME',
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

class BottomDetailsBar extends StatelessWidget {
  const BottomDetailsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15,
      ),
      child: Row(
        children: [
          const Icon(Icons.keyboard_arrow_down),
          const SizedBox(
            width: 12.0,
          ),
          const Text(
            'Hide list',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Text(
            'TO PICK:',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
          ),
          const Text(
            '1/6',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            width: 1.0,
            height: 16.0,
            color: kBorderColor,
          ),
          const Text(
            'AVERAGE:',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
          ),
          const Text(
            '\$0.0M',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class GoUpTheListFAB extends StatelessWidget {
  final ScrollController listController;

  const GoUpTheListFAB({
    Key? key,
    required this.listController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: ElevatedButton(
        onPressed: () => listController.animateTo(
          listController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size.fromRadius(20),
          elevation: 2,
          primary: Colors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.black,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
