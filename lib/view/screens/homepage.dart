import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:skechers/controller/cart_controller.dart';
import 'package:skechers/model/featur_model.dart';
import 'package:skechers/view/screens/Cart_Screen.dart';
import 'package:skechers/view/screens/catagory.dart';
import 'package:skechers/view/screens/navigation_bar.dart';
import 'package:skechers/view/screens/product_detail.dart';
import 'package:skechers/view/screens/product_page.dart';
import 'package:skechers/view/screens/profile.dart';
import 'package:skechers/view/screens/reward.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:skechers/view/widgets/banner.dart';
import 'package:skechers/view/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartController controller = Get.put(CartController());
  List<String> catagories=[
    'New In',
    'Men',
    'Women',
    'Kids',
    'Sale',
    'Accessories',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
// appBar: AppBar(
//   backgroundColor: Colors.white,
//   elevation: 0.0,iconTheme: IconThemeData(color: Color(kcolor)),),
//         backgroundColor: Colors.white,
//         drawer:CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: Get.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 50,
                            width: Get.width * 0.4,
                          ),
                          SizedBox(width: Get.width*0.25,),
                          InkWell(
                            onTap: (){
                              Get.to(CartScreen());
                            },
                            child: Stack(
                              children: [
                                Icon(
                                  CupertinoIcons.cart_fill,
                                  color: Color(kcolor),
                                  size: 25,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 8,
                                    child:

                                    Obx(() => Text(
                                      controller.orders.length.toString(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],

                      ),


                    ),
                    CustomTextfield(
                      inputText: 'Search your Product here',
                      obsecure: false,
                      prefixIcon: Icons.search,


                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                CustomBanner(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Catagories',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(kcolor)),
                      ),


                    ],
                  ),
                ),
                Container(
                  height: Get.height*0.06,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catagories.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Get.to(  ProductPage(productList: FeatureProduct.feature, name: catagories[index],));
                            },
                            child: Container(
height: Get.height*0.5,
                              decoration: BoxDecoration(
                                color: Color(kcolor),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              width: Get.width*0.25,

                              child:Center(child: Text(catagories[index],style: TextStyle(color: Colors.white),)) ,
                            ),
                          ),
                        );
                      }),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Feature Products',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(kcolor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width*0.9,
                  height: Get.height*0.29,
                  child: GridView.builder(
                    itemCount: FeatureProduct
                        .feature.length, // Number of items in your grid
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      mainAxisSpacing: 0.0, // Space between rows
                      crossAxisSpacing: 2.0, // Space between columns
                      childAspectRatio:
                          0.8, // Ratio between the width and height of grid items
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // This function is called for each grid item
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                        name: FeatureProduct.feature[index].name,
                                        price:
                                            FeatureProduct.feature[index].price,
                                        image:
                                            FeatureProduct.feature[index].image,
                                        desCription: FeatureProduct
                                            .feature[index].detail)));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Card(
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
// Adjust as per your need
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        FeatureProduct.feature[index].image),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    FeatureProduct.feature[index].name,
                                    style: TextStyle(fontSize: 12),
                                    maxLines: 1,
                                  ),
                                  Text(FeatureProduct.feature[index].price
                                          .toString() +
                                      "\$"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class items {
  final String image;
  final String title;

  items(this.image, this.title);
}
