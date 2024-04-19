import '../../data/model/ticket_model.dart';

abstract class NewTicketRepository {
  Future<void> createTicket(NewTicketModel ticket);
  Future<List<NewTicketModel>> readTickets({required String userId});
  Future<NewTicketModel> updateTicket(NewTicketModel newTicket);
  Future<void> delete({required String ticketId});
}
