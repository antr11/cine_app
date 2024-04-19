class NewTicketEntity {
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

  NewTicketEntity({
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
}
