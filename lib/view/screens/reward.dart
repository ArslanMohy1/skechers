import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:skechers/view/widgets/custom_botton.dart';
import 'package:skechers/view/widgets/custom_textfield.dart';


class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  automaticallyImplyLeading: false,

  title: Text('Loyalty Points',style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.bold,color: Color(kcolor)),),
),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(

                children: [
                  SizedBox(height: Get.height*0.05,),
Container(
  decoration: BoxDecoration(color: Color(kcolor),borderRadius: BorderRadius.circular(10)),
  height: Get.height*0.2,
  width: Get.width*0.8,

  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Loyalty Points',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    ),
    Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('0',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Icon(Icons.star,color: Colors.yellow,)
            ],
    ),

  ],),

),









                ],),
            ),
        SizedBox(height: Get.height*0.05,),
            Container(
              height: Get.height*0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context,index){
                return  Card(
                  color: Colors.white,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: Get.height*0.2,
                    width: Get.width*0.4,
                    child: Column(


                      children: [
                        SizedBox(height: Get.height*0.05,),
                        Text('10% Discount',style: TextStyle(color: Color(kcolor),fontWeight: FontWeight.bold,fontSize: 20),),
                        Text('for 1000 points'),
                        SizedBox(height: Get.height*0.05,),
                        Container(

                          height: Get.height*0.04,
                          width: Get.width*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(kcolor),
                          ),
                          child: Center(child: Text('Claim',style: TextStyle(color: Colors.white),)),
                        )
                      ],),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Vouchers',style: TextStyle(color: Color(kcolor),fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  child: ListTile(
                    leading: Icon(CupertinoIcons.ticket),
                    title: Text('10% Discount Voucher'),
                    subtitle: Text('Voucher Code XXXXXXX'),
                    trailing:IconButton(onPressed: (){
                      Get.snackbar(
                        'Copied',
                        'Voucher code copied to clipboard',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                      );
                    },icon: Icon(Icons.copy),)
                  ),
                ),
              );
            }))
     


          ],
        ),
      ),
    );
  }
}
