import 'package:dartz/dartz.dart';
import 'package:play_on/core/domain/error/failures.dart';
import 'package:play_on/layers/data/models/players_model.dart';

abstract class PlayersRepository {
  Future<Either<Failure, PlayersModel>> getPlayers();
}
