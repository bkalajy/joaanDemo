import 'package:flutter/material.dart';
import 'package:joaan_demo/Resources/app_resources.dart';

class DeliveryTime extends StatelessWidget {
  final double containerWidth;
  final String timeJoann;
  final String timeRes;
  final String minJoaan;
  final String minRes;

  const DeliveryTime(
      {Key? key,
      required this.containerWidth,
      required this.timeJoann,
      required this.timeRes,
      required this.minJoaan,
      required this.minRes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/Images/Page 5/Restaurant.png',
              width: containerWidth * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: containerWidth * 0.02),
              child: Text('Restaurant Delivery | Time: $timeRes min | ',
                  style: TextStyle(
                      color: AppColors.iron,
                      fontFamily: AppFonts.fontPoppins,
                      fontSize: containerWidth * 0.03,
                      fontWeight: FontWeight.w500)),
            ),
            Text('Min: $minRes',
                style: TextStyle(
                    color: AppColors.darkGrey,
                    fontFamily: AppFonts.fontPoppins,
                    fontSize: containerWidth * 0.03,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        if (minJoaan.compareTo('0') != 0) buildJoaanDelivery()
      ],
    );
  }

  Widget buildJoaanDelivery() {
    return (Row(
      children: [
        Image.asset(
          'assets/Images/Page 5/Joaan.png',
          width: containerWidth * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(left: containerWidth * 0.02),
          child: Text('Joa’an Delivery | Time: $timeJoann min | ',
              style: TextStyle(
                  color: AppColors.iron,
                  fontFamily: AppFonts.fontPoppins,
                  fontSize: containerWidth * 0.03,
                  fontWeight: FontWeight.w500)),
        ),
        Text('Min: $minJoaan',
            style: TextStyle(
                color: AppColors.darkGrey,
                fontFamily: AppFonts.fontPoppins,
                fontSize: containerWidth * 0.03,
                fontWeight: FontWeight.w500)),
      ],
    ));
  }
}
