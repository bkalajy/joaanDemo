import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'package:joaan_demo/Components/CusOutlinedButton.dart';
import 'package:joaan_demo/Components/CusTextButton.dart';
import 'package:joaan_demo/Components/PrimaryButton.dart';
import 'package:joaan_demo/UI/phoneNumberScreen.dart';

import '../Resources/app_resources.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
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
                          height: 119,
                        ),

                        const Text(
                          'We sent a 4-digits',
                          style: TextStyle(
                              color: AppColors.scarlet,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 24),
                        ),

                        const Text(
                          'To your phone',
                          style: TextStyle(
                              color: AppColors.scarlet,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 28),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        buildPinPut(),

                        const SizedBox(
                          height: 20,
                        ),

                        //Primary Button
                        PrimaryButton(
                          txt: 'Confirm',
                          color: AppColors.mango,
                          onPressed: navigateToNextScreen,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Center(
                          child: CusTextButton(
                              txt: 'Didn\u0027t recieve a code ?',
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

  Widget buildPinPut() {
    final defaultPinTheme = PinTheme(
      width: 92,
      height: 92,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.iron),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.scarlet),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void navigateToNextScreen() {
    unfocus(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhoneScreen()));
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
