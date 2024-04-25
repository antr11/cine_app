import 'package:cine_app/commom/constants/assets.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:cine_app/features/account/widget/mini_widget/date_picker_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../data/domain/entities/account_entity.dart';

class InformationWidget extends StatefulWidget {
  final String? avatarUrl;
  final String? name;
  final String? email;
  final DateTime? birthday;
  final String? phone;
  final String? city;
  final String? gender;
  const InformationWidget({
    super.key,
    this.avatarUrl,
    this.name,
    this.email,
    this.birthday,
    this.phone,
    this.city,
    this.gender,
  });

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  final fullNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();

  AccountEntity? accountState; //
  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 1,
          color: Globalvariables.primaryContainer,
        ),
      );

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
        _email(),
        _city(),
        _gender(),
      ],
    );
  }

  Container _gender() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Gender",
            style: Globalvariables.labelMedium,
          ),
          Text(
            widget.gender ?? "",
            style: Globalvariables.bodyMedium,
          )
        ],
      ),
    );
  }

  Container _city() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "City",
            style: Globalvariables.labelMedium,
          ),
          Text(
            widget.city ?? "",
            style: Globalvariables.bodyMedium,
          )
        ],
      ),
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
            style: Globalvariables.labelMedium,
          ),
          Text(
            widget.email ?? "",
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
            style: Globalvariables.labelMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.phone ?? '',
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              formatDate(
                  widget.birthday ?? DateTime.now(), [dd, '-', mm, '-', yyyy]),
              style: Globalvariables.bodyMedium,
            ),
          ),
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
            widget.name ?? '',
            style: Globalvariables.bodyMedium,
          )
        ],
      ),
    );
  }
}
