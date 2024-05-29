import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/view/screens/Exchange_policy.dart';
import 'package:skechers/view/screens/FAQ.dart';
import 'package:skechers/view/screens/login.dart';
import 'package:skechers/view/screens/privacy_policy.dart';
import 'package:skechers/view/screens/profile.dart';
import 'package:skechers/view/utils/constant.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text('Setting',style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.bold,color: Color(kcolor)),),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(

                  children: [InkWell(
                    onTap: (){
                      Get.to(Profile());
                    },
                    child: Card(
                      elevation:5.0,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                      child: ListTile(
                        leading: Icon(CupertinoIcons.profile_circled,color: Color(kcolor),size: 35,),
                        title: Text('Profile',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                    ),
                  ),

                    InkWell(
                      onTap: (){
                        showExchangeReturnPolicyDialog(context);
                      },
                      child: Card(
                        elevation:5.0,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                        child: ListTile(
                          leading: Icon(Icons.edit_note,color: Color(kcolor),size: 35,),
                          title: Text('Return Policy',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       showPrivacyPolicyDialog(context);
                      },
                      child: Card(
                        elevation:5.0,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                        child: ListTile(
                          leading: Icon(Icons.privacy_tip,color: Color(kcolor),size: 35,),
                          title: Text('Privacy Policy',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      ),
                    ),
                    Card(
                      elevation:5.0,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                      child: ListTile(
                        leading: Icon(CupertinoIcons.question_circle_fill,color: Color(kcolor),size: 35,),
                        title: Text('About us',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showHelpFAQDialog(context);
                      },
                      child: Card(
                        elevation:5.0,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                        child: ListTile(
                          leading: Icon(Icons.info,color: Color(kcolor),size: 35,),
                          title: Text('FAQ',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      ),
                    ),

                    Card(
                      elevation:5.0,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                      child: ListTile(
                        leading: Icon(Icons.highlight_remove,color: Color(kcolor),size: 35,),
                        title: Text('Delete Account',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Card(
                        elevation:5.0,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                        child: ListTile(
                          leading: Icon(Icons.logout_sharp,color: Color(kcolor),size: 35,),
                          title: Text('Log out',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        ),

      ),
    );
  }
  void showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PrivacyPolicyDialog();
      },

    );
}
  void showExchangeReturnPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExchangeReturnPolicyDialog();
      },
    );
  }
  void showHelpFAQDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HelpFAQDialog();
      },
    );
  }



}
