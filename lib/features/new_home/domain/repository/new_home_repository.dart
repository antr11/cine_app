import '../../data/models/movie.dart';

abstract class NewHomeRepository {
  Future<List<NewMovie>?> getUpcomingMovies();
}
