import '../../data/model/new_movie_detail.dart';
import '../../data/model/new_movie_session.dart';
import '../../data/model/new_movie_video_response.dart';

abstract class NewMovieDetailRepository {
  Future<NewMovieDetail> getMovieDetail(String movieId);
  Future<NewMovieVideoReponse> getMovieVideos(String movieId);
  Future<List<NewMovieSession>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  });
}
