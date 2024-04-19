import '../../data/models/movie.dart';
import '../../data/remote/new_home_rest_api.dart';
import 'new_home_repository.dart';

class NewHomeRepositoryImplement extends NewHomeRepository {
  final NewHomeRestApi datasource;

  NewHomeRepositoryImplement(this.datasource);
  @override
  Future<List<NewMovie>?> getUpcomingMovies() async {
    final response = await datasource.getUpcomingMovies('vi-VN', '1');
    return response.results;
  }
}
