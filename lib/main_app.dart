import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on/constants/constants.dart';
import 'package:play_on/injection_container.dart' as di;
import 'package:play_on/layers/presentation/manager/players_cubit.dart';
import 'package:play_on/layers/presentation/manager/rename_team_submit_button_cubit.dart';
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';
import 'package:play_on/layers/presentation/pages/splash/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PlayersCubit>()),
        BlocProvider(create: (_) => di.sl<TeamsCubit>()),
        BlocProvider(create: (_) => di.sl<RenameTeamSubmitButtonCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: kAppThemeData,
        home: const SplashScreen(),
      ),
    );
  }
}
