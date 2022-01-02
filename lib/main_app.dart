import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/injection_container.dart' as di;
import 'package:play_on_task/layers/presentation/manager/players_cubit.dart';
import 'package:play_on_task/layers/presentation/pages/teams/teams_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PlayersCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: kAppThemeData,
        home: const TeamsScreen(),
      ),
    );
  }
}
