// ignore_for_file: public_member_api_docs, sort_constructors_first
class TicketEntity {
  String? id;
  String? title; // col
  double? runTime; // col
  String? filmFormat;
  String? theater;
  DateTime? time;
  List<String>? seats; // "S7, S8, S9"
  double? unitPrice;
  String? userId;
  DateTime? createdAt;

  TicketEntity({
    this.id,
    this.title,
    this.runTime,
    this.filmFormat,
    this.theater,
    this.time,
    this.seats,
    this.unitPrice,
    this.userId,
    this.createdAt,
  });

  TicketEntity copyWith({
    String? id,
    String? title,
    double? runTime,
    String? filmFormat,
    String? theater,
    DateTime? time,
    List<String>? seats,
    double? unitPrice,
    String? userId,
    DateTime? createdAt,
  }) {
    return TicketEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      runTime: runTime ?? this.runTime,
      filmFormat: filmFormat ?? this.filmFormat,
      theater: theater ?? this.theater,
      time: time ?? this.time,
      seats: seats ?? this.seats,
      unitPrice: unitPrice ?? this.unitPrice,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
