import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/features/players/presentation/manager/players_cubit.dart';
import 'package:play_on_task/features/players/presentation/pages/players_screen.dart';
import 'package:play_on_task/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PlayersCubit>()),
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: kAppThemeData,
        home: const PlayersScreen(),
      ),
    );
  }
}
