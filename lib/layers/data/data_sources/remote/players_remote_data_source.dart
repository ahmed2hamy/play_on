import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:play_on_task/constants/constants.dart';
import 'package:play_on_task/core/data/network/network_helper.dart';
import 'package:play_on_task/core/domain/error/failures.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';

abstract class PlayersRemoteDataSource {
  Future<Either<Failure, PlayersModel>> getRemotePlayers();
}

class PlayersRemoteDataSourceImpl implements PlayersRemoteDataSource {
  final Dio _dio;
  const PlayersRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, PlayersModel>> getRemotePlayers() async {
    try {
      final Map<String, dynamic> response =
          await NetworkHelper.getData(_dio, endPoint: kPLayersEndpoint);

      final PlayersModel playerModel = PlayersModel.fromJson(response);

      return Right(playerModel);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
