import 'package:flutter/material.dart';

import '../../../ticket/domain/entites/ticket_entity.dart';

class AccountPaymentHistoryWidget extends StatefulWidget {
  final List<TicketEntity> tickets;
  final Function(String) onDelete;
  const AccountPaymentHistoryWidget(
      {super.key, required this.tickets, required this.onDelete});

  @override
  State<AccountPaymentHistoryWidget> createState() =>
      _AccountPaymentHistoryWidgetState();
}

class _AccountPaymentHistoryWidgetState
    extends State<AccountPaymentHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
