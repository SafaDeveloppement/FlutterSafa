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
          SizedBox(
            height: 850,
            child: PageView(
              controller: _controller,
              children: const [
                starting1(),
                starting2(),
                starting3(),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0, // Adjust the position as needed
            left: 150,
            right: 0,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.white
              ), // You can customize the indicator effect
            ),
          ),
        ],
      ),
    );
  }
}
