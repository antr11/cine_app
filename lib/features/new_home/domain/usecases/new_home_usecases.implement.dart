import '../../data/models/movie.dart';
import '../repository/new_home_repository.dart';
import '../repository/new_home_repository.implement.dart';
import 'new_home_usecases.dart';

class NewHomeUsecasesImplement extends NewHomeUsecases {
  final NewHomeRepository repo;

  NewHomeUsecasesImplement(this.repo);
  @override
  Future<List<NewMovie>?> getUpcomingMovies() {
    return repo.getUpcomingMovies();
  }
}
