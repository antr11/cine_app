// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../commom/emuns/bloc_status.dart';

import '../../data/models/movie.dart';

class HomeState {
  BlocStatusState status;
  List<NewMovie>? upcomingMovies;
  String? errorMessage;
  HomeState({
    required this.status,
    this.upcomingMovies,
    this.errorMessage,
  });

  HomeState copyWith({
    required BlocStatusState status,
    List<NewMovie>? upcomingMovies,
    String? errorMessage,
  }) {
    return HomeState(
      status: status,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      errorMessage: errorMessage,
    );
  }
}
