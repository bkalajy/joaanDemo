import 'package:flutter/material.dart';
import 'package:joaan_demo/Resources/app_resources.dart';

class ImageWithDiscount extends StatelessWidget {
  final String discount;
  final String path;
  const ImageWithDiscount(
      {Key? key, required this.discount, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            path,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset(
            'assets/Images/Page 5/banner.png',
            width: 30,
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 23, top: 5),
          child: Text(
            '$discount%',
            style: const TextStyle(
                color: AppColors.white,
                fontFamily: AppFonts.fontPoppins,
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
