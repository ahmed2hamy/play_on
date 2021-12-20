import 'package:dartz/dartz.dart';
import 'package:play_on_task/core/domain/error/failures.dart';
import 'package:play_on_task/core/domain/usecases/usecase.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/domain/repositories/players_repository.dart';

class GetAllPlayersUseCase implements UseCase<PlayersModel, NoParams> {
  final PlayersRepository _repository;

  GetAllPlayersUseCase({
    required PlayersRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, PlayersModel>> call(NoParams noParams) async {
    return _repository.getPlayers();
  }
}
