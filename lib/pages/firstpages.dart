import 'package:flutter/material.dart';
import 'package:applicationpef/auth/starting1.dart';
import 'package:applicationpef/auth/starting2.dart';
import 'package:applicationpef/auth/starting3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView containing background images
          PageView(
            controller: _controller,
            children: const [
              starting1(),
              starting2(),
              starting3(),
            ],
          ),

          // SmoothPageIndicator placed in front of background images
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(activeDotColor: Colors.white),
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
