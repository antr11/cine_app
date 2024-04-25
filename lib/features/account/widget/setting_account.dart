import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/commom/ultis/localizations.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../commom/constants/assets.dart';

class SettingAccountWidget extends StatefulWidget {
  const SettingAccountWidget({
    super.key,
  });

  @override
  State<SettingAccountWidget> createState() => _SettingAccountWidgetState();
}

class _SettingAccountWidgetState extends State<SettingAccountWidget> {
  bool isSelectedVn = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context).settings,
          style: Globalvariables.bodyMedium
              .copyWith(color: Globalvariables.primaryContainer),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translate(context).language,
                style: Globalvariables.titleSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLanguageItem(isVn: true, isSelected: isSelectedVn),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildLanguageItem(isVn: false, isSelected: !isSelectedVn),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageItem({required bool isVn, required bool isSelected}) {
    final color = isSelected
        ? Globalvariables.onPrimary
        : Globalvariables.primaryContainer;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelectedVn = isVn;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: color,
          ),
        ),
        child: SvgPicture.asset(
          isVn ? Assets.svg.icVnFlag : Assets.svg.icEnFlag,
        ),
      ),
    );
  }
}
