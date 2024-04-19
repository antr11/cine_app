import '../models/movie.dart';

abstract class NewHomeRemoteDatasource {
  Future<List<NewMovie>?> getUpcomingMovies();
}
