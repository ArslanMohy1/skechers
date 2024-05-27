import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skechers/view/utils/constant.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool delivered = true;
  bool processing = false;
  bool cancelled = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text('My Orders',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15,color: Color(kcolor)),),

        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          delivered = true;
                          cancelled = false;
                          processing = false;
                        });
                      },
                      child: Container(
                        height: Get.height * 0.035,
                        width: Get.width * 0.25,
                        child: Center(
                          child: Text('Delivered', style: GoogleFonts.inter(color: delivered ? Colors.white : Color(kcolor))),
                        ),
                        decoration: BoxDecoration(
                          color: delivered ? Color(kcolor) : Colors.white,
                          border: Border.all(color: Color(kcolor)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          delivered = false;
                          cancelled = false;
                          processing = true;
                        });
                      },
                      child: Container(
                        height: Get.height * 0.035,
                        width: Get.width * 0.25,
                        child: Center(
                          child: Text('Processing', style: GoogleFonts.inter(color: processing ? Colors.white : Color(kcolor))),
                        ),
                        decoration: BoxDecoration(
                          color: processing ? Color(kcolor) : Colors.white,
                          border: Border.all(color: Color(kcolor)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          delivered = false;
                          cancelled = true;
                          processing = false;
                        });
                      },
                      child: Container(
                        height: Get.height * 0.035,
                        width: Get.width * 0.25,
                        child: Center(
                          child: Text('Cancelled', style: GoogleFonts.inter(color: cancelled ? Colors.white : Color(kcolor))),
                        ),
                        decoration: BoxDecoration(
                          color: cancelled ? Color(kcolor) : Colors.white,
                          border: Border.all(color: Color(kcolor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [

                  Lottie.network('https://lottie.host/5f065819-446e-4d82-9a7b-f20b702b4cf9/6Tvx0EqHkf.json'),
                  Text('No order yet',style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.bold,color: Color(kcolor)),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please Order now',style: GoogleFonts.inter(fontSize: 12),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
