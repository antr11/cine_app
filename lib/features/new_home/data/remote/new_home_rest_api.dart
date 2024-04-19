import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movie.dart';
import '../models/movie_response.dart';

part 'new_home_rest_api.g.dart';

@RestApi()
abstract class NewHomeRestApi {
  factory NewHomeRestApi(Dio dio, {String baseUrl}) = _NewHomeRestApi;

  @GET('/movie/now_playing')
  Future<MovieResponse> getUpcomingMovies(
    @Query('language') String language,
    @Query('page') String page,
  );
}
