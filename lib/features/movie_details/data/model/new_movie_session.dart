import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/new_movie_session_entity.dart';

@JsonSerializable()
// Tưởng tượng có 1 API gửi về những data này
class NewMovieSession {
  @JsonKey(name: 'session_time')
  DateTime? sessionTime;
  @JsonKey(name: 'film_format')
  String? filmFormat;
  @JsonKey(name: 'theater_name')
  String? theaterName;
  @JsonKey(name: 'adult_ticket_price')
  int? adultTicketPrice;
  @JsonKey(name: 'child_ticket_price')
  double? childTicketPrice;
  @JsonKey(name: 'student_ticket_price')
  double? studentTicketPrice;
  @JsonKey(name: 'vip_ticket_price')
  double? vipTicketPrice;
  NewMovieSession({
    this.sessionTime,
    this.filmFormat,
    this.theaterName,
    this.adultTicketPrice,
    this.childTicketPrice,
    this.studentTicketPrice,
    this.vipTicketPrice,
  });

  // TODO: From Json, to JSON

  NewMovieSessionEntity convertToEntity() {
    return NewMovieSessionEntity(
      sessionTime: sessionTime, // Lấy filed bên model gán cho entity
      filmFormat: filmFormat,
      theater: theaterName,
      adultPrice: adultTicketPrice?.toDouble(),
      childPrice: childTicketPrice,
      studentPrice: studentTicketPrice,
      vipPrice: vipTicketPrice,
    );
  }
}
