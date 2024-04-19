// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../commom/service/dio_client.dart';

import '../../../../main.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import 'new_home_remote_datasource.dart';

class NewHomeRemoteDatasourceImplement extends NewHomeRemoteDatasource {
  DioClient dioClien = dioClient;

  @override
  Future<List<NewMovie>?> getUpcomingMovies() async {
    final result = await dioClient.dio.get('/movie/now_playing');
    final responseJson = result.data as Map<String, dynamic>;
    final response = MovieResponse.fromJson(responseJson);
    return response.results;
  }
}
