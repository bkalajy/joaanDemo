import 'package:flutter/material.dart';
import 'package:joaan_demo/Resources/app_resources.dart';

class Carousel extends StatefulWidget {
  final List<Widget> widgets;
  final int initialPage;
  final double fractions;
  final bool indicatorState;
  final double height;
  final double margin;

  const Carousel({
    Key? key,
    required this.widgets,
    required this.initialPage,
    required this.fractions,
    required this.indicatorState,
    required this.height,
    required this.margin,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late int activePage;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    activePage = widget.initialPage;
    _pageController = PageController(
        viewportFraction: widget.fractions, initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.height,
          child: PageView.builder(
              itemCount: widget.widgets.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: EdgeInsets.all(widget.margin),
                  child: widget.widgets[pagePosition],
                );
              }),
        ),
        if (widget.indicatorState)
          SizedBox(
              height: widget.height * 0.20,
              child: buildIndicator(widget.widgets.length, activePage))
      ],
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.mango : AppColors.iron,
          shape: BoxShape.circle),
    );
  });
}

Widget buildIndicator(length, activePage) {
  return Column(
    children: [
      const Spacer(flex: 2),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(length, activePage))
    ],
  );
}
