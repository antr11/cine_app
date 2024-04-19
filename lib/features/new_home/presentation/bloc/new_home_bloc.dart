import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commom/emuns/bloc_status.dart';

import '../../../../main.dart';
import '../../data/remote/new_home_rest_api.dart';
import '../../domain/repository/new_home_repository.implement.dart';
import '../../domain/usecases/new_home_usecases.dart';
import '../../domain/usecases/new_home_usecases.implement.dart';
import 'new_home_event.dart';
import 'new_home_state.dart';

class NewHomeBloc extends Bloc<NewHomeEvent, NewHomeState> {
  NewHomeBloc() : super(NewHomeState(status: BlocStatusState.initial)) {
    on<GetUpcomingMovieNewHomeEvent>(_onGetUpcomingMovieNewHomeEvent);
  }

  final NewHomeUsecases _usecase = NewHomeUsecasesImplement(
    NewHomeRepositoryImplement(NewHomeRestApi(dioClient.dio)),
  );

  FutureOr<void> _onGetUpcomingMovieNewHomeEvent(
    GetUpcomingMovieNewHomeEvent event,
    Emitter<NewHomeState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    // Xử lý get data
    try {
      final movies = await _usecase.getUpcomingMovies();
      if (movies != null) {
        emit(
          state.copyWith(
            status: BlocStatusState.success,
            upcomingMovies: movies,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatusState.failed,
            errorMessage: 'Đã xảy ra lỗi',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
    // emit success
    // emit failed
  }
}
