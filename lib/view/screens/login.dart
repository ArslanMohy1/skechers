import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:skechers/view/screens/navigation_bar.dart';
import 'package:skechers/view/screens/signup.dart';
import 'package:skechers/view/widgets/custom_botton.dart';
import 'package:skechers/view/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  void showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width * 0.9,
                child: Image.asset('assets/logo.png'),
              ),
              CustomTextfield(
                inputText: 'Email',
                obsecure: false,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: Get.height * 0.03),
              CustomTextfield(
                inputText: 'Password',
                obsecure: true,
                prefixIcon: Icons.lock,
                postfixIcon: CupertinoIcons.eye_slash_fill,
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Color(0xff0B2948),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              CustomButton(
                onTap: () async {
                  bool isConnected = await checkInternetConnection();
                  if (isConnected) {
                    Get.to(BottomBar());
                  } else {
                    showNoInternetDialog(context);
                  }
                },
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have account yet?',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Color(0xff0B2948),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Color(0xff0B2948),
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
