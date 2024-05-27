import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/model/catogory_model.dart';
import 'package:skechers/model/featur_model.dart';
import 'package:skechers/model/men_catagory_model.dart';
import 'package:skechers/view/screens/product_page.dart';
import 'package:skechers/view/screens/sub_catagories.dart';
import 'package:skechers/view/utils/constant.dart';
class Catagories extends StatefulWidget {
  const Catagories({super.key});

  @override
  State<Catagories> createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text('Categories',style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.bold,color: Color(kcolor)),),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Number of items per row
          crossAxisSpacing: 8.0,  // Spacing between columns
          mainAxisSpacing: 0.0,  // Spacing between rows
          childAspectRatio: 1.5,  // Ratio of item width to height
        ),
        itemCount: CatagoryModel.catagory.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if(CatagoryModel.catagory[index].name == 'new')
                Get.to(ProductPage(
                  productList: FeatureProduct.feature,
                  name: CatagoryModel.catagory[index].name,
                ));
                else if(CatagoryModel.catagory[index].name == 'men'){
Get.to(

    Subcatagories(title:CatagoryModel.catagory[index].name, catagoryList: MenCatagoryModel.Men, ));
                }
                else if(CatagoryModel.catagory[index].name == 'women'){
                  Get.to(

                      Subcatagories(title:CatagoryModel.catagory[index].name, catagoryList: MenCatagoryModel.Women, ));
                }
                else if(CatagoryModel.catagory[index].name == 'kids'){
                  Get.to(

                      Subcatagories(title:CatagoryModel.catagory[index].name, catagoryList: MenCatagoryModel.Kids, ));
                }
                else if(CatagoryModel.catagory[index].name == 'sale'){
                  Get.to(

                      Subcatagories(title:CatagoryModel.catagory[index].name, catagoryList: MenCatagoryModel.Sale, ));
                }
                else if(CatagoryModel.catagory[index].name == 'accessories'){
                  Get.to(

                      Subcatagories(title:CatagoryModel.catagory[index].name, catagoryList: MenCatagoryModel.Accessories, ));
                }
              },
              child: Column(
                children: [
                  Container(

                    child: Image.asset( CatagoryModel.catagory[index].image,height: 60,),
                  ),
                  Text(CatagoryModel.catagory[index].name,style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.bold,color: Color(kcolor)),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
