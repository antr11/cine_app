// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cine_app/features/new_home/presentation/home_route.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as f_storage;
import 'package:cine_app/commom/constants/app_constant.dart';
import 'package:cine_app/commom/constants/custom_button.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/commom/ultis/localizations.dart';
import 'package:cine_app/features/account/bloc/account_bloc.dart';
import 'package:cine_app/features/account/bloc/account_event.dart';
import 'package:cine_app/features/account/bloc/account_state.dart';
import 'package:cine_app/features/account/change_infor/widget/account_texfield.dart';
import 'package:cine_app/features/account/data/domain/entities/account_entity.dart';
import 'package:cine_app/features/account/widget/ava_name_profile.dart';
import 'package:cine_app/features/account/widget/mini_widget/date_picker_widget.dart';

import '../../../commom/constants/assets.dart';
import '../../../commom/emuns/bloc_status.dart';
import '../../../commom/emuns/gender.dart';

class ChangeInforScreen extends StatefulWidget {
  const ChangeInforScreen({
    super.key,
  });

  @override
  State<ChangeInforScreen> createState() => _ChangeInforScreenState();
}

class _ChangeInforScreenState extends State<ChangeInforScreen> {
  AccountEntity? currentAccount;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  Gender selectedGender = Gender.male;
  DateTime selectedDate = DateTime.now();
  AccountBloc get bloc => BlocProvider.of<AccountBloc>(context);
  AccountEntity? account;
  final ImagePicker _picker = ImagePicker();
  XFile? imageXFile;
  Uint8List? imageData;
  String imageUserUrl = '';
  // Future<void> _getImage() async {
  //   imageXFile = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageXFile;
  //   });
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   f_storage.Reference reference = f_storage.FirebaseStorage.instance
  //       .ref()
  //       .child("accounts")
  //       .child(fileName);
  //   f_storage.UploadTask uploadTask = reference.putFile(File(imageXFile!.path));
  //   f_storage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
  //   await taskSnapshot.ref.getDownloadURL().then((url) => {
  //         imageUserUrl = url,
  //       });
  // }

  // Text Controller
  final fullNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();

  // Data

  void handleDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      bloc.add(GetAccountInfoEvent(userId: userId));
    }
    account?.id = userId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.status == BlocStatusState.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
        if (state.status == BlocStatusState.success) {
          if (state.successMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).inform,
              message: state.successMessage,
            );
            // toast
          }
        } else if (state.status == BlocStatusState.failed) {
          if (state.errorMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).error,
              message: state.errorMessage,
            );
            // toast
          }
        }
      },
      builder: (context, state) {
        account = state.account;
        return Scaffold(
          backgroundColor: Globalvariables.backgroundColor,
          appBar: AppBar(
            backgroundColor: Globalvariables.backgroundColor,
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        imageXFile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          imageXFile;
                        });

                        String fileName =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        f_storage.Reference reference = f_storage
                            .FirebaseStorage.instance
                            .ref()
                            .child("accounts")
                            .child(fileName);
                        f_storage.UploadTask uploadTask =
                            reference.putFile(File(imageXFile!.path));
                        f_storage.TaskSnapshot taskSnapshot =
                            await uploadTask.whenComplete(() {});
                        await taskSnapshot.ref.getDownloadURL().then((url) {
                          imageUserUrl = url;
                        });
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: imageXFile == null
                            ? null
                            : FileImage(File(imageXFile!.path)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AccountTextField(
                      title: translate(context).fullName,
                      controller: fullNameTextController,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translate(context).dateOfBirth,
                          style: Globalvariables.bodyLarge,
                        ),
                        DatePickerWidget(onDateChanged: handleDateChanged),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AccountTextField(
                      title: translate(context).phoneNumber,
                      controller: phoneNumberTextController,
                    ),
                    const SizedBox(height: 20),
                    CSCPicker(
                      showCities: true,
                      showStates: true,
                      countryFilter: const [
                        CscCountry.Vietnam,
                        CscCountry.United_States,
                        CscCountry.Australia
                      ],
                      onCountryChanged: (value) {
                        setState(() {
                          ///store value in country variable
                          countryValue = value;
                        });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        setState(() {
                          ///store value in state variable
                          stateValue = value ?? '';
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          cityValue = value ?? '';
                        });
                      },
                      cityDropdownLabel: "city",
                      countryDropdownLabel: "Country",
                      stateDropdownLabel: "State",
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _gender(),
                    _saveButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _saveButton() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      alignment: Alignment.center,
      child: SizedBox(
        width: 90,
        child: CustomButton(
          color: Globalvariables.selectedNavBarColor,
          onTap: () {
            // account = account?.copyWith(
            //   avatarUrl:
            //       'https://image.kpopmap.com/2023/09/ILL-IT-Minju-Profile.jpg',
            //   fullName: fullNameTextController.text,
            //   phoneNumber: phoneNumberTextController.text,
            //   email: FirebaseAuth.instance.currentUser?.email,
            //   city: city,
            //   dateOfBirth: selectedDate,
            //   gender: selectedGender,
            // );
            // bloc.add(SetAccountInfoEvent(entity: account));
            final account = AccountEntity(
              avatarUrl: imageUserUrl,
              fullName: fullNameTextController.text,
              phoneNumber: phoneNumberTextController.text,
              email: FirebaseAuth.instance.currentUser?.email,
              city: cityValue,
              dateOfBirth: selectedDate,
              gender: selectedGender,
              id: FirebaseAuth.instance.currentUser?.uid,
            );
            bloc.add(SetAccountInfoEvent(entity: account));
            Navigator.pushNamed(context, NewHomeRoute.screenName);
          },
          text: translate(context).save,
        ),
      ),
    );
  }

  Widget _gender() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text(
              translate(context).male,
              style: Globalvariables.bodySmall,
            ),
            value: Gender.male,
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          RadioListTile(
            title: Text(
              translate(context).female,
              style: Globalvariables.bodySmall,
            ),
            value: Gender.female,
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          RadioListTile(
            title: Text(
              translate(context).other,
              style: Globalvariables.bodySmall,
            ),
            value: Gender.other,
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
