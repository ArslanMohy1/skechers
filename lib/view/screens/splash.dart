import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skechers/view/screens/login.dart';
import 'package:skechers/view/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  Future startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }
  void navigationPage() {
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
  }
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() {
      if (mounted) setState(() {});
    });
    animationController.forward();

    startTime();
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     // colors: [blackColor, blackColor],
            //     colors: [blackColor,Colors.white],
            //   ),
            // ),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset('assets/logo.png',  width: animation.value * 250,
              height: animation.value * 250,),
              const SizedBox(height: 20),
              // Text(
              //   Kstrings.appName,
              //   style: GoogleFonts.poppins(
              //     fontSize: 40,
              //     height: 1,
              //     color: Colors.white,
              //     fontWeight: FontWeight.w900,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
