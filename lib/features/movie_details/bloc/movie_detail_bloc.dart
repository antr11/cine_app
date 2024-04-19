import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../../../commom/emuns/bloc_status.dart';

import '../domain/usecase/movie_detail_usecases.dart';
import '../domain/usecase/movie_detail_usecases.implement.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class NewMovieDetailBloc
    extends Bloc<NewMovieDetailEvent, NewMovieDetailState> {
  NewMovieDetailBloc()
      : super(NewMovieDetailState(status: BlocStatusState.initial)) {
    on<GetNewMovieDetailEvent>(_onGetNewMovieDetailEvent);
    on<GetNewMovieSessionsEvent>(_onGetNewMovieSessionsEvent);
  }

  final NewMovieDetailUsecases _usecase = NewMovieDetailUsecasesImplement();

  FutureOr<void> _onGetNewMovieDetailEvent(
    GetNewMovieDetailEvent event,
    Emitter<NewMovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final movieDetail =
          await _usecase.getMovieDetail(event.movieId); // 3s response
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          movieDetail: movieDetail,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onGetNewMovieSessionsEvent(
    GetNewMovieSessionsEvent event,
    Emitter<NewMovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final movieSession = await _usecase.getMovieSessions(
        movieId: event.movieId,
        sessionDate: event.sessionDate,
      ); // 3s response
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          movieSessions: movieSession,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
