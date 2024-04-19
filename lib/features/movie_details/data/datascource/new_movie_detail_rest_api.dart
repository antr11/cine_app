import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/new_movie_detail.dart';
import '../model/new_movie_video_response.dart';

part 'new_movie_detail_rest_api.g.dart';

@RestApi()
abstract class NewMovieDetailRestApi {
  factory NewMovieDetailRestApi(Dio dio, {String baseUrl}) =
      _NewMovieDetailRestApi;

  @GET('/movie/{movie_id}')
  Future<NewMovieDetail> getMovieDetail(
    @Path('movie_id') String movieId,
  );

  @GET('/movie/{movie_id}/videos')
  Future<NewMovieVideoReponse> getMovieVideos(
    @Path('movie_id') String movieId,
  );
}
