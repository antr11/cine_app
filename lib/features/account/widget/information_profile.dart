import 'package:cine_app/commom/constants/assets.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:cine_app/features/account/widget/mini_widget/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  final fullNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 1,
          color: Globalvariables.primaryContainer,
        ),
      );
  void _handleDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Information',
          style:
              TextStyle(fontSize: 16, color: Globalvariables.primaryContainer),
        ),
        _fullName(),
        _birthDay(),
        _phoneNumber(),
        _email()
      ],
    );
  }

  Container _email() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Email",
            style: Globalvariables.bodyMedium,
          ),
          Text(
            userinfor.email,
            style: Globalvariables.bodyMedium,
          )
        ],
      ),
    );
  }

  Container _phoneNumber() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Phone Number",
            style: Globalvariables.bodyMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              userinfor.phone,
              style: Globalvariables.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Container _birthDay() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Birth day",
            style: Globalvariables.labelMedium,
          ),
          DatePickerWidget(onDateChanged: _handleDateChanged)
        ],
      ),
    );
  }

  Widget _fullName() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'FullName',
            style: Globalvariables.labelMedium,
          ),
          Text(
            userinfor.name,
            style: Globalvariables.bodyMedium,
          )
        ],
      ),
    );
  }
}
