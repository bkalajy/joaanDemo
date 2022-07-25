import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joaan_demo/Components/CusBottomNavigation.dart';
import 'package:joaan_demo/Components/CusIconButton.dart';
import 'package:joaan_demo/Components/DeliveryTime.dart';
import 'package:joaan_demo/Components/ImageWithDiscount.dart';

import '../Components/ImageCarousel.dart';
import '../Resources/app_resources.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                      Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            buildHeader(),
                            Positioned(bottom: -5, child: buildSearchBar()),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 594,
                        child:
                            ListView(scrollDirection: Axis.vertical, children: [
                          SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: Carousel(
                              widgets: [
                                carouselItem(AppColors.mango),
                                carouselItem(AppColors.green),
                                carouselItem(AppColors.coralRed),
                              ],
                              initialPage: 1,
                              fractions: 0.95,
                              indicatorState: false,
                              height: 200,
                              margin: 4,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Text(
                              'Special Offer',
                              style: TextStyle(
                                  color: AppColors.iron,
                                  fontFamily: AppFonts.fontPoppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: SizedBox(
                              height: height * 0.244,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  carouselItemImage(
                                      'assets/Images/Page 5/fried_chicken.jpg',
                                      [
                                        'MacDonalds',
                                        'Big Burger',
                                        '30',
                                        '30',
                                        '60.00\u0024',
                                        '30.00\u0024',
                                        '35.00',
                                        '35',
                                      ]),
                                  carouselItemImage(
                                      'assets/Images/Page 5/burger.jpg', [
                                    'MacDonalds',
                                    'Big Burger',
                                    '30',
                                    '30',
                                    '60.00\u0024',
                                    '30.00\u0024',
                                    '35.00',
                                    '35',
                                  ]),
                                  carouselItemImage(
                                      'assets/Images/Page 5/fried_chicken.jpg',
                                      [
                                        'MacDonalds',
                                        'Big Burger',
                                        '30',
                                        '30',
                                        '60.00\u0024',
                                        '30.00\u0024',
                                        '35.00',
                                        '35',
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const CusBottomNavigation(
              selectedItem: AppColors.mango,
              disabledItem: AppColors.darkGrey,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.workspaces_outlined),
                    label: 'Test',
                    tooltip: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.headset_mic_outlined),
                    label: 'Test',
                    tooltip: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_tree_outlined),
                    label: 'Test',
                    tooltip: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart_outlined),
                    label: 'Test',
                    tooltip: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Test',
                    tooltip: ''),
              ],
            )));
  }

  Widget carouselItem(Color color) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
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
                    fontSize: 26,
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
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/Images/Page 4/bag.png',
              )),
        ],
      ),
    );
  }

  Widget carouselItemImage(String path, List<String> offer) {
    //Offer List : [Restaurant name , Meal name , Restaurant time, Joaan's time , Restaurant min , Joaan min , Price , Discount]
    //                    0                1               2             3               4              5        6        7

    String restaurantName = offer[0];
    String price = offer[6];
    String discount = offer[7];
    double cardWidth = width * 0.70;

    Widget image;
    if (discount.isEmpty) {
      image = Image.asset(
        path,
        fit: BoxFit.fitWidth,
      );
    } else {
      image = ImageWithDiscount(discount: discount, path: path);
    }

    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(width: 1, color: AppColors.iron)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: cardWidth,
          color: AppColors.white,
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: image,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.033),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Restaurant name
                    Text(
                      '${restaurantName}',
                      style: TextStyle(
                          color: AppColors.mango,
                          fontFamily: AppFonts.fontPoppins,
                          fontSize: cardWidth * 0.046,
                          fontWeight: FontWeight.w500),
                    ),

                    Text(
                      '${price}',
                      style: TextStyle(
                        color: AppColors.iron,
                        fontFamily: AppFonts.fontPoppins,
                        fontSize: cardWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: cardWidth * 0.033),
                child: DeliveryTime(
                    containerWidth: 300,
                    timeJoann: offer[3],
                    timeRes: offer[2],
                    minJoaan: offer[5],
                    minRes: offer[4]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

// void navigateToNextScreen() {
//   unfocus(context);
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => const PhoneScreen()));
// }

  Widget buildHeader() {
    return Column(
      children: [
        Container(
            height: 160,
            width: double.infinity,
            color: AppColors.mango,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Row(children: [
                    Image.asset('assets/Images/Page 5/profile.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.fontPoppins,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Baraa KALAJY',
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFonts.fontPoppins,
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.notifications_none,
                      size: 35,
                      color: AppColors.white,
                    )
                  ]),
                ),
              ),
            )),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget buildSearchBar() {
    final FocusNode Node = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          Node.requestFocus();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
              height: 60.0,
              margin: const EdgeInsets.only(
                  bottom: 10.0), //Same as `blurRadius` i guess
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.iron,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.location_on_outlined,
                        size: 26, color: AppColors.mango),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Work Address',
                          style: TextStyle(
                              color: AppColors.mango,
                              fontFamily: AppFonts.fontPoppins,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 18,
                          width: 230,
                          child: TextField(
                            focusNode: Node,
                            //autofocus: true,
                            style: const TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 14,
                                fontFamily: AppFonts.fontPoppins),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your work address here !!',
                                hintStyle: TextStyle(
                                    color: AppColors.iron,
                                    fontSize: 14,
                                    fontFamily: AppFonts.fontPoppins)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 18,
                      ),
                      label: const Text(
                        'Search',
                        style: TextStyle(
                            fontFamily: AppFonts.fontPoppins, fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(40, 50),
                          primary: AppColors.scarlet),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
