import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RenameTeamSubmitButtonCubit extends Cubit<RenameTeamState> {
  RenameTeamSubmitButtonCubit() : super(SubmitButtonDisabled());

  void disableSubmitButton() {
    emit(SubmitButtonDisabled());
  }

  void enableSubmitButton() {
    emit(SubmitButtonEnabled());
  }
}

abstract class RenameTeamState extends Equatable {
  const RenameTeamState();
}

class SubmitButtonDisabled extends RenameTeamState {
  @override
  List<Object> get props => [];
}

class SubmitButtonEnabled extends RenameTeamState {
  @override
  List<Object> get props => [];
}
