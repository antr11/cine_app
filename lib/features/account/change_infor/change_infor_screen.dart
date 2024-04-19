import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/commom/ultis/localizations.dart';
import 'package:cine_app/features/account/change_infor/widget/account_texfield.dart';
import 'package:cine_app/features/account/data/domain/entities/account_entity.dart';
import 'package:cine_app/features/account/widget/ava_name_profile.dart';
import 'package:cine_app/features/account/widget/mini_widget/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../commom/constants/assets.dart';
import '../../../commom/emuns/gender.dart';

class ChangeInforScreen extends StatefulWidget {
  const ChangeInforScreen({super.key});

  @override
  State<ChangeInforScreen> createState() => _ChangeInforScreenState();
}

class _ChangeInforScreenState extends State<ChangeInforScreen> {
  DateTime selectedDate = DateTime.now();
  AccountEntity? changedAccount;
  void handleDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalvariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Globalvariables.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarWidget(),
            const SizedBox(height: 10),
            AccountTextField(title: translate(context).fullName),
            DatePickerWidget(onDateChanged: handleDateChanged),
            AccountTextField(title: translate(context).phoneNumber),
            AccountTextField(title: translate(context).email),
            _buildGender(),
          ],
        ),
      ),
    );
  }

  Widget _buildGender() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).gender,
            style: Globalvariables.titleSmall,
          ),
          Row(
            children: [
              _buildRadioItem(
                isSelected: changedAccount?.gender == Gender.male,
                value: Gender.male,
                onChanged: (value) {
                  setState(() {
                    changedAccount = changedAccount?.copyWith(gender: value);
                  });
                },
              ),
              const SizedBox(
                width: 4,
              ),
              _buildRadioItem(
                isSelected: changedAccount?.gender == Gender.female,
                value: Gender.female,
                onChanged: (value) {
                  setState(() {
                    changedAccount = changedAccount?.copyWith(gender: value);
                  });
                },
              ),
              const SizedBox(
                width: 4,
              ),
              _buildRadioItem(
                isSelected: changedAccount?.gender == Gender.other,
                value: Gender.other,
                onChanged: (value) {
                  setState(() {
                    changedAccount = changedAccount?.copyWith(gender: value);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem({
    required bool isSelected,
    required Gender value,
    required Function(Gender) onChanged,
  }) {
    final color = isSelected
        ? Globalvariables.onPrimary
        : Globalvariables.primaryContainer;
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: color,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isSelected
                  ? Assets.svg.icRadioChecked
                  : Assets.svg.icRadioUnchecked,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              value.getTitle(context),
              style: Globalvariables.bodyMedium.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
