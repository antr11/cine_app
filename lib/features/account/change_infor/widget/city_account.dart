import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({
    super.key,
    required this.city,
    required this.country,
    required this.state,
  });

  final String city;
  final String country;
  final String state;

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showCities: true,
      showStates: true,
      onCityChanged: (city1) {
        city1 = city;
      },
      onCountryChanged: (country1) {
        country1 = country;
      },
      onStateChanged: (state1) {
        state1 = state;
      },
      cityDropdownLabel: city,
      countryDropdownLabel: country,
      stateDropdownLabel: state,
      selectedItemStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),

      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
      dropdownHeadingStyle: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

      ///DropdownDialog Item style [OPTIONAL PARAMETER]
      dropdownItemStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
    );
  }
}
