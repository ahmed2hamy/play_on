// import 'dart:math';
//
// import 'package:dartz/dartz.dart';
// import 'package:play_on_task/core/domain/error/failures.dart';
// import 'package:play_on_task/core/domain/usecases/usecase.dart';
// import 'package:play_on_task/features/players/data/models/players_model.dart';
// import 'package:play_on_task/features/players/domain/repositories/players_repository.dart';
//
// class CreateTeamUseCase implements UseCase<PlayersModel, NoParams> {
//   final PlayersRepository _repository;
//   List<Player> _allPlayers = [];
//   List<Player> _drivers = [];
//   late Player _constructor;
//
//   CreateTeamUseCase({
//     required PlayersRepository repository,
//   }) : _repository = repository;
//
//   @override
//   Future<Either<Failure, PlayersModel>> call(NoParams noParams) async {
//     return _repository.getPlayers();
//   }
//
//
//   void _manipulatePlayersLists(){
//     final _players = state.playersModel.players ?? [];
//
//     final List<Player> drivers = _players
//         .where((e) => e.position == Position.driver)
//         .toList();
//
//     final List<Player> constructors = _players
//         .where((e) => e.position == Position.constructor)
//         .toList();
//
//     final _randomDrivers = List.generate(
//       5,
//           (_) {
//         Player player =
//         drivers[Random().nextInt(drivers.length)];
//         drivers.remove(player);
//         return player;
//       },
//     );
//
//     final _randomConstructor =
//     constructors[Random().nextInt(constructors.length)];
//   }
// }
