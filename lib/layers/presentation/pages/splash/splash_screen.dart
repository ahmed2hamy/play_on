import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/core/presentation/helpers/app_navigator.dart';
import 'package:play_on/core/presentation/helpers/screen_info.dart';
import 'package:play_on/core/presentation/widgets/dialogs.dart';
import 'package:play_on/layers/presentation/manager/players_cubit.dart';
import 'package:play_on/layers/presentation/pages/teams/teams_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlayersCubit>().getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayersCubit, PlayersState>(
      listener: (context, state) {
        if (state is PlayersErrorState) {
          Dialogs.buildSnackBar(context, state.errorMessage);
        } else if (state is PlayersLoadedState) {
          Future.delayed(const Duration(seconds: 3)).then(
            (_) => AppNavigator.pushReplacement(
              context,
              widget: TeamsScreen(
                allPlayers: state.playersModel.players ?? [],
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: SvgPicture.asset(
            kLogoSvg,
            width: ScreenInfo.screenWidth(context) * 0.6,
          ),
        ),
      ),
    );
  }
}
