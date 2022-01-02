import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitialState());
}

abstract class TeamsState extends Equatable {
  const TeamsState();
}

class TeamsInitialState extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsLoadingState extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsLoadedState extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsErrorState extends TeamsState {
  final String errorMessage;

  const TeamsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
