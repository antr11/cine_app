import '../entities/movie_detail_entity.dart';
import '../entities/new_movie_session_entity.dart';

abstract class NewMovieDetailUsecases {
  Future<NewMovieDetailEntity> getMovieDetail(String movieId);
  Future<List<NewMovieSessionEntity>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  });
}
