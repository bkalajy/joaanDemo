import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:joaan_demo/Components/CusOutlinedButton.dart';
import 'package:joaan_demo/Components/CusTextButton.dart';
import 'package:joaan_demo/Components/PrimaryButton.dart';
import 'package:joaan_demo/UI/pincodeScreen.dart';

import '../Resources/app_resources.dart';

import 'package:joaan_demo/Components/PrimaryButton.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UnFocus(context),
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.02,
                  image: AssetImage("assets/Images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHeader(),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 40,
                        ),

                        CusOutlinedButton(
                          txt: 'Support Center',
                          color: AppColors.scarlet,
                          height: 55,
                          width: 180,
                        ),

                        const SizedBox(
                          height: 100,
                        ),

                        const Text(
                          'Hello There !',
                          style: TextStyle(
                              color: AppColors.scarlet,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 24),
                        ),

                        const Text(
                          'What Are You\nHungry for?',
                          style: TextStyle(
                              color: AppColors.scarlet,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  buildPhoneTextfield(number, phoneController),
                            )),

                        const SizedBox(
                          height: 20,
                        ),

                        //Primary Button
                        PrimaryButton(
                          txt: 'Send a Code',
                          color: AppColors.mango,
                          onPressed: navigateToNextScreen,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Center(
                          child: CusTextButton(
                              txt: 'Enter as a Guest',
                              color: AppColors.scarlet,
                              size: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhoneTextfield(
      PhoneNumber number, TextEditingController controller) {
    return InternationalPhoneNumberInput(
      textStyle: const TextStyle(
          color: AppColors.black, fontFamily: 'poppins', fontSize: 16),
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(
          color: AppColors.black, fontFamily: 'poppins', fontSize: 15),
      initialValue: number,
      textFieldController: controller,
      formatInput: false,
      inputDecoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Phone number',
        hintStyle: TextStyle(
            color: AppColors.iron, fontFamily: 'poppins', fontSize: 16),
        contentPadding: EdgeInsets.only(left: -25, bottom: 12.5),
      ),
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }

  void UnFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void navigateToNextScreen() {
    UnFocus(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PinScreen()));
  }

  Widget buildHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 10,
            color: AppColors.scarlet,
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            color: AppColors.mango,
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            color: AppColors.green,
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            color: AppColors.coralRed,
          ),
        ),
      ],
    );
  }
}
