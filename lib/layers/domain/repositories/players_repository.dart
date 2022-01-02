import 'package:dartz/dartz.dart';
import 'package:play_on_task/core/domain/error/failures.dart';
import 'package:play_on_task/layers/data/models/players_model.dart';

abstract class PlayersRepository {
  Future<Either<Failure, PlayersModel>> getPlayers();
}
