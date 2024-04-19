// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../commom/emuns/bloc_status.dart';

import '../domain/entities/movie_detail_entity.dart';
import '../domain/entities/new_movie_session_entity.dart';

class NewMovieDetailState {
  BlocStatusState status;
  NewMovieDetailEntity? movieDetail;
  List<NewMovieSessionEntity>? movieSessions;
  String? successMessage; // Toast, snackbar
  String? errorMessage; // Dialog
  NewMovieDetailState({
    required this.status,
    this.movieDetail,
    this.movieSessions,
    this.successMessage,
    this.errorMessage,
  });

  NewMovieDetailState copyWith({
    required BlocStatusState status,
    NewMovieDetailEntity? movieDetail,
    List<NewMovieSessionEntity>? movieSessions,
    String? successMessage,
    String? errorMessage,
  }) {
    return NewMovieDetailState(
      status: status, // alway replace new value
      movieDetail: movieDetail ?? this.movieDetail, // cache
      movieSessions: movieSessions ?? this.movieSessions, // cache
      successMessage: successMessage, // do not pass <=> null
      errorMessage: errorMessage, // do not pass <=> null
    );
  }
}
