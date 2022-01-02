import 'package:dartz/dartz.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/data/network/network_info.dart';
import 'package:play_on_task/core/domain/error/failures.dart';
import 'package:play_on_task/layers/data/data_sources/remote/players_remote_data_source.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';
import 'package:play_on_task/layers/domain/repositories/players_repository.dart';

class PlayersRepositoryImpl implements PlayersRepository {
  final PlayersRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PlayersRepositoryImpl({
    required PlayersRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, PlayersModel>> getPlayers() async {
    if (await _networkInfo.isConnected) {
      return await _remoteDataSource.getRemotePlayers();
    } else {
      return const Left(ServerFailure(message: Strings.noNetworkErrorMessage));
    }
  }
}
