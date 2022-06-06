import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:play_on/core/data/network/network_info.dart';
import 'package:play_on/layers/data/data_sources/remote/players_remote_data_source.dart';
import 'package:play_on/layers/data/repositories/players_repository_impl.dart';
import 'package:play_on/layers/domain/repositories/players_repository.dart';
import 'package:play_on/layers/domain/use_cases/get_players_use_case.dart';
import 'package:play_on/layers/presentation/manager/players_cubit.dart';
import 'package:play_on/layers/presentation/manager/rename_team_submit_button_cubit.dart';
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Services init
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc
  sl.registerLazySingleton(() => PlayersCubit(
        getAllPlayersUseCase: sl<GetAllPlayersUseCase>(),
      ));
  sl.registerLazySingleton(() => TeamsCubit());
  sl.registerLazySingleton(() => RenameTeamSubmitButtonCubit());

  // Use cases
  sl.registerFactory(
      () => GetAllPlayersUseCase(repository: sl<PlayersRepository>()));

  // Repository
  sl.registerFactory<PlayersRepository>(() => PlayersRepositoryImpl(
        remoteDataSource: sl<PlayersRemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

  // Data sources
  sl.registerFactory<PlayersRemoteDataSource>(
      () => PlayersRemoteDataSourceImpl(dio: sl<Dio>()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<Connectivity>()));

  //! External
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Dio());
}
