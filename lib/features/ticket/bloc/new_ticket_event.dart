// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../domain/entites/ticket_entity.dart';

abstract class NewTicketEvent {}

class CreateNewTicketEvent extends NewTicketEvent {
  NewTicketEntity ticket;
  CreateNewTicketEvent({
    required this.ticket,
  });
}
