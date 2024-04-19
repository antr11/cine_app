// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class NewMovieDetailEvent {}

class GetNewMovieDetailEvent extends NewMovieDetailEvent {
  String movieId;
  GetNewMovieDetailEvent({
    required this.movieId,
  });
}

class GetNewMovieSessionsEvent extends NewMovieDetailEvent {
  String movieId;
  DateTime sessionDate;
  GetNewMovieSessionsEvent({
    required this.movieId,
    required this.sessionDate,
  });
}
