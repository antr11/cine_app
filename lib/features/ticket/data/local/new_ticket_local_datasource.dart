// DAO
import '../model/ticket_model.dart';

abstract class NewTicketLocalDatasource {
  void initDB();
  Future<List<NewTicketModel>> readTickets({required String userId});
  Future<void> createTicket(NewTicketModel ticket);
  Future<NewTicketModel> updateTicket(NewTicketModel newTicket);
  Future<void> deleteTicket(String ticketId);
  void clearData();
}
