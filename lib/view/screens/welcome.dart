import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:skechers/view/screens/login.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:skechers/view/widgets/custom_botton.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<IntroItem> introItems = [
    IntroItem(
      title: 'Welcome to Skechers',
      description:
      "Discover the ease and excitement of online shopping with Skechers, where convenience meets quality.",
      imageUrl: 'assets/intro1.png',
    ),
    IntroItem(
      title: 'Get Started',
      description:
      "Whether you're hunting for the latest fashion trends, must-have gadgets, unique gifts, our app brings the marketplace to your fingertips",
      imageUrl: 'assets/intro2.png',
    ),
    // Add more IntroItem instances for additional screens
  ];

  late CarouselController _carouselController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white, // Set background color
      body: Column(

        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: _carouselController,
              items: introItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(kcolor),
                            ),
                          ),
                          Container(
                            height: Get.height*0.4,
                            child: Image.asset(
                              item.imageUrl,

                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(kcolor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < introItems.length; i++)
                Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == i ? Color(0xff0B2948) : Colors.grey,
                  ),
                ),
            ],
          ),
          SizedBox(height: Get.height * 0.03),
          CustomButton(
            title: _currentIndex == introItems.length - 1 ? 'Start' : 'Next',
            onTap: () {
              if (_currentIndex < introItems.length - 1) {
                _carouselController.nextPage();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class IntroItem {
  final String title;
  final String description;
  final String imageUrl;

  IntroItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
