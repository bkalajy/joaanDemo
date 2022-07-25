import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:joaan_demo/Components/ImageCarousel.dart';
import 'package:joaan_demo/UI/phoneNumberScreen.dart';

import '../Resources/app_resources.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> images = <String>['img1', 'img2', 'img3'];
  final List<String> headText = <String>[
    'Joa\'an\nRestaurants',
    'Joa\'an\nSupermarkets',
    'Joa\'an\nChefs'
  ];
  final List<String> descreption = <String>[
    'Lorem Ipsum is simply dummy text of the printing and typesetting',
    'Lorem Ipsum is simply dummy text of the printing and typesetting',
    'Lorem Ipsum is simply dummy text of the printing and typesetting',
  ];
  final List<Color> colors = <Color>[
    AppColors.scarlet,
    AppColors.mango,
    AppColors.green
  ];

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

                  //Text
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        Text(
                          'Farouk!',
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 32),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.white,
                                  onPrimary: AppColors.iron,
                                  shadowColor: AppColors.white,
                                  elevation: 0
                                  //minimumSize: const Size(double.infinity, 70),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10.0),
                                  // ),
                                  ),
                              child: SizedBox(
                                height: 100,
                                //color: AppColors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            headText[index],
                                            style: TextStyle(
                                                color: colors[index],
                                                fontFamily:
                                                    AppFonts.fontPoppins,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(
                                            width: 220,
                                            child: Text(
                                              descreption[index],
                                              style: const TextStyle(
                                                  color: AppColors.black,
                                                  fontFamily:
                                                      AppFonts.fontPoppins,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/Images/Page 4/${images[index]}.png'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
    int activePage = 0;

    return SizedBox(
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -220,
            left: -100,
            child: Container(
              width: 600.0,
              height: 510.0,
              decoration: const BoxDecoration(
                color: AppColors.scarlet,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -250,
            left: -120,
            child: Container(
              width: 550.0,
              height: 480.0,
              decoration: const BoxDecoration(
                color: AppColors.lightScarlet,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 240,
                width: double.infinity,
                child: Carousel(
                  widgets: [
                    carouselItem(),
                    carouselItem(),
                    carouselItem(),
                  ],
                  initialPage: 2,
                  fractions: 1.0,
                  indicatorState: true,
                  height: 200,
                  margin: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget carouselItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Order Now!',
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontFamily: AppFonts.fontPoppins),
            ),
            Text(
              'And get 1 for free!',
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  fontFamily: AppFonts.fontPoppins),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(
              'assets/Images/Page 4/bag.png',
            )),
      ],
    );
  }
}
