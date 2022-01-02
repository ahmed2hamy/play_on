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
import 'package:play_on/layers/presentation/manager/teams_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Services init
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc
  sl.registerLazySingleton(() => PlayersCubit(getAllPlayersUseCase: sl()));
  sl.registerLazySingleton(() => TeamsCubit());

  // Use cases
  sl.registerFactory(() => GetAllPlayersUseCase(repository: sl()));

  // Repository
  sl.registerFactory<PlayersRepository>(
      () => PlayersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerFactory<PlayersRemoteDataSource>(
      () => PlayersRemoteDataSourceImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Dio());
}
