import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:play_on_task/core/domain/usecases/usecase.dart';
import 'package:play_on_task/features/players/data/models/players_model.dart';
import 'package:play_on_task/features/players/domain/use_cases/get_players_use_case.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final GetAllPlayersUseCase _getAllPlayersUseCase;

  PlayersCubit({
    required GetAllPlayersUseCase getAllPlayersUseCase,
  })  : _getAllPlayersUseCase = getAllPlayersUseCase,
        super(PlayersInitialState());

  Future getPlayers() async {
    emit(PlayersLoadingState());
    final res = await _getAllPlayersUseCase.call(NoParams());

    res.fold(
      (failure) => emit(PlayersErrorState(failure.message)),
      (model) => emit(PlayersLoadedState(model)),
    );
  }
}

abstract class PlayersState extends Equatable {
  const PlayersState();
}

class PlayersInitialState extends PlayersState {
  @override
  List<Object> get props => [];
}

class PlayersLoadingState extends PlayersState {
  @override
  List<Object> get props => [];
}

class PlayersLoadedState extends PlayersState {
  final PlayersModel playersModel;

  const PlayersLoadedState(this.playersModel);

  @override
  List<Object> get props => [];
}

class PlayersErrorState extends PlayersState {
  final String errorMessage;

  const PlayersErrorState(this.errorMessage);

  @override
  List<Object> get props => [];
}
