import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/view/utils/constant.dart';

class CustomBanner extends StatefulWidget {
  @override
  _CustomBannerState createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  final List<Map<String, String>> items = [
    {
      'image':
          'https://shoestreet.pk/cdn/shop/files/SKX_WEB_BANNERS_0001_Vector_Smart_Object_Custom.jpg?v=1708342320',
      'title': "SHOP WOMEN",
    },
    {
      'image':
'https://shoestreet.pk/cdn/shop/files/SKX_WEB_BANNERS_0000_Vector_Smart_Object_Custom.jpg?v=1708342320',      'title': "SHOP MEN",
    },
    {
      'image':
          'https://shoestreet.pk/cdn/shop/files/SKX_WEB_BANNERS_0002_Vector_Smart_Object_Custom.jpg?v=1708342320',
      'title': "SHOP KIDS",
    },

  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 0.4,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      item['title']!,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(kcolor),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        DotsIndicator(
          dotsCount: items.length,
          position: _currentIndex,
          decorator: DotsDecorator(
            color: Colors.grey, // Inactive dot color
            activeColor: Colors.black, // Active dot color
            size: Size.square(8.0), // Size of dots
            activeSize: Size(20.0, 8.0), // Size of active dot
            spacing: EdgeInsets.symmetric(horizontal: 4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
