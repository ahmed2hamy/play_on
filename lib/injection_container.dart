import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:play_on_task/core/data/network/network_info.dart';
import 'package:play_on_task/layers/data/data_sources/remote/players_remote_data_source.dart';
import 'package:play_on_task/layers/data/repositories/players_repository_impl.dart';
import 'package:play_on_task/layers/domain/repositories/players_repository.dart';
import 'package:play_on_task/layers/domain/use_cases/get_players_use_case.dart';
import 'package:play_on_task/layers/presentation/manager/players_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Services init
  WidgetsFlutterBinding.ensureInitialized();

  //! Features

  //Players
  _initPLayersFeature();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Dio());
}

void _initPLayersFeature() {
  // Bloc
  sl.registerLazySingleton(() => PlayersCubit(getAllPlayersUseCase: sl()));

  // Use cases
  sl.registerFactory(() => GetAllPlayersUseCase(repository: sl()));

  // Repository
  sl.registerFactory<PlayersRepository>(
      () => PlayersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerFactory<PlayersRemoteDataSource>(
      () => PlayersRemoteDataSourceImpl(dio: sl()));
}
