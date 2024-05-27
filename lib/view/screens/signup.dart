import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skechers/view/screens/login.dart';
import 'package:skechers/view/widgets/custom_botton.dart';
import 'package:skechers/view/widgets/custom_textfield.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(height: Get.height*0.2,width: Get.width*0.9,
                child: Image.asset('assets/logo.png'),),
              CustomTextfield(inputText: 'Name', obsecure: false,prefixIcon: Icons.person,),

              SizedBox(height: Get.height*0.03,),

              CustomTextfield(inputText: 'Email', obsecure: false,prefixIcon: Icons.email,type: TextInputType.emailAddress,),
              SizedBox(height: Get.height*0.03,),
              CustomTextfield(inputText: 'Mobile No', obsecure: false,prefixIcon: Icons.phone_android,type:
                TextInputType.number,),
              SizedBox(height: Get.height*0.03,),
              CustomTextfield(inputText: 'Password', obsecure: true,postfixIcon: CupertinoIcons.eye_slash_fill,prefixIcon: Icons.lock,),
              SizedBox(height: Get.height*0.03,),
              CustomTextfield(inputText: 'Confirm Password', obsecure: true,postfixIcon: CupertinoIcons.eye_slash_fill,prefixIcon: Icons.lock,),
              SizedBox(height: Get.height*0.03,),
              CustomButton(onTap: (){
Get.to(LoginScreen());
              },title: 'Sign up',),

              SizedBox(height: Get.height*0.03,),


            ],
          ),
        ),),

    );
  }
}
