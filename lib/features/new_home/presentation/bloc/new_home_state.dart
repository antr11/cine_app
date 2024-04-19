// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../commom/emuns/bloc_status.dart';

import '../../data/models/movie.dart';

class NewHomeState {
  BlocStatusState status;
  List<NewMovie>? upcomingMovies;
  String? errorMessage;
  NewHomeState({
    required this.status,
    this.upcomingMovies,
    this.errorMessage,
  });

  NewHomeState copyWith({
    required BlocStatusState status,
    List<NewMovie>? upcomingMovies,
    String? errorMessage,
  }) {
    return NewHomeState(
      status: status,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      errorMessage: errorMessage,
    );
  }
}
