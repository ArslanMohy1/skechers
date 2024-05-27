import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/model/catogory_model.dart';
import 'package:skechers/model/featur_model.dart';
import 'package:skechers/view/screens/product_page.dart';
import 'package:skechers/view/utils/constant.dart';
class Subcatagories extends StatefulWidget {
  final String title;
  final List catagoryList;
  const Subcatagories({super.key, required this.title, required this.catagoryList});

  @override
  State<Subcatagories> createState() => _SubcatagoriesState();
}

class _SubcatagoriesState extends State<Subcatagories> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
// backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

        SizedBox(height: Get.height*0.05,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(CupertinoIcons.back,color: Color(kcolor),)),
            Text(
              widget.title,
              style: GoogleFonts.inter(color: Color(kcolor), fontSize: 18, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      Expanded(
        child: Container(
          
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,

            itemCount: widget.catagoryList.length,
            itemBuilder: (context, index) {
              return Customtile(title: widget.catagoryList[index].Heading, onTap:(){
               Get.to(

                   SubSubCategories(title:  widget.catagoryList[index].Heading, finalCategories: widget.catagoryList[index]. SubHeadings));


              });
            },
          ),


        ),
      ),

        ],),


    );
  }
}

class Customtile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const Customtile({
    Key? key, required this.title, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 16,color: Color(kcolor)),),
      trailing: IconButton(icon: Icon(Icons.arrow_forward_ios,color: Color(kcolor),),onPressed: onTap,),
    );
  }
}
class SubSubCategories extends StatelessWidget {
  final String title;
  final List finalCategories;
  const SubSubCategories({super.key, required this.title, required this.finalCategories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: Get.height*0.05,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(CupertinoIcons.back)),
            Text(
              title,
              style: GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),

          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: finalCategories.length,
              itemBuilder: (context,index){
            return Customtile(title: finalCategories[index], onTap: (){
              Get.to(ProductPage(
                productList: FeatureProduct.feature,
                name: CatagoryModel.catagory[index].name,
              ));
            });
          }),
        )


      ],),
    );
  }
}
