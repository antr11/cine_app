import 'dart:math';

import 'package:cine_app/commom/ultis/date_utils.dart';

import '../../../../main.dart';
import '../../../new_home/data/remote/new_home_rest_api.dart';

import '../../data/datascource/new_movie_detail_rest_api.dart';

import '../../data/model/new_movie_detail.dart';
import '../../data/model/new_movie_session.dart';
import '../../data/model/new_movie_video_response.dart';
import 'movie_detail_repository.dart';

class NewMovieDetailRepositoryImplement extends NewMovieDetailRepository {
  final NewMovieDetailRestApi _datasource =
      NewMovieDetailRestApi(dioClient.dio);
  @override
  Future<NewMovieDetail> getMovieDetail(String movieId) {
    return _datasource.getMovieDetail(movieId);
  }

  @override
  Future<NewMovieVideoReponse> getMovieVideos(String movieId) {
    return _datasource.getMovieVideos(movieId);
  }

  @override
  Future<List<NewMovieSession>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  }) async {
    // mock data
    final dateOnly = sessionDate.getDateOnly();
    final theaterConstanst = [
      'Thiso Mall',
      'Gigamall',
      'Vạn Hạnh Mall',
      'Bitexco',
      'Hùng Vương',
      'AEON Mall Tân Phú',
      'AEON Mall Bình Tân',
    ];
    const refPrice = 100000;
    final filmFormatConstants = ['3D', '4D', '3D Max', 'Vietsub', 'Lồng tiếng'];

    final result = <NewMovieSession>[];
    for (var i = 0; i < 20; i++) {
      theaterConstanst.shuffle();
      filmFormatConstants.shuffle();
      result.add(
        NewMovieSession(
          sessionTime: dateOnly.copyWith(hour: Random().nextInt(23)),
          theaterName: theaterConstanst.first,
          filmFormat: filmFormatConstants.first,
          adultTicketPrice: refPrice,
          childTicketPrice: refPrice * 0.5,
          studentTicketPrice: refPrice * 0.7,
          vipTicketPrice: refPrice * 0.8,
        ),
      );
    }
    return result;
  }
}
