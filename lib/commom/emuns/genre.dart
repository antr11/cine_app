import 'package:cine_app/commom/constants/app_constant.dart';

enum Genre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  honor,
  music,
  mystery,
  romance,
  scienceFiction,
  tvMovie,
  thriller,
  war,
  western;

  static Genre? getGenreById(int id) {
    return genreIdsConstMap[id];
  }
}
