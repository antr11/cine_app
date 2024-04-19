import '../../data/models/movie.dart';

abstract class NewHomeUsecases {
  Future<List<NewMovie>?> getUpcomingMovies();
}
