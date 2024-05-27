import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final double? fontsize;
  final String? title;
  const CustomButton({
    super.key, this.height, this.width, required this.onTap, this.title, this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        child: Center(child: Text(title ?? 'Log in',style: GoogleFonts.roboto(textStyle:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: fontsize ??  20) ),)),
        height: height ?? Get.height*0.06,
        width: width ?? Get.width*0.9,
        decoration: BoxDecoration(color:Color(0xff0B2948),borderRadius: BorderRadius.circular(5),boxShadow: [
          BoxShadow(color: Colors.black),
        ]),

      ),
    );
  }
}
