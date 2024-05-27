import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:skechers/controller/cart_controller.dart';
import 'package:skechers/model/order_model.dart';
import 'package:skechers/view/screens/Cart_Screen.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:skechers/view/utils/db_helper.dart';
import 'package:skechers/view/widgets/custom_botton.dart';
import 'package:skechers/view/widgets/shoe_size.dart';
// Import your order model

class ProductDetail extends StatefulWidget {
  final String name;
  final int price;
  final String image;
  final String desCription;

  const ProductDetail({super.key, required this.name, required this.price, required this.image, required this.desCription});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CartController controller = Get.put(CartController());

  double rating = 4.5;
  bool des = true;
  bool review = false;
  bool specs = false;
  int quantity = 1;
  String selectedSize = ''; // Default size or add logic to select size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.back, color: Color(kcolor)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Color(kcolor)),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.06),
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.9,
              child: Image.network(widget.image),
            ),
            SizedBox(height: Get.height * 0.01),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Price',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Color(kcolor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.price.toString() + '\$',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Color(kcolor)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        des = true;
                        specs = false;
                        review = false;
                      });
                    },
                    child: Container(
                      height: Get.height * 0.03,
                      width: Get.width * 0.25,
                      child: Center(
                        child: Text('Description', style: GoogleFonts.inter(color: des ? Colors.white : Color(kcolor))),
                      ),
                      decoration: BoxDecoration(
                        color: des ? Color(kcolor) : Colors.white,
                        border: Border.all(color: Color(kcolor)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        des = false;
                        specs = false;
                        review = true;
                      });
                    },
                    child: Container(
                      height: Get.height * 0.03,
                      width: Get.width * 0.25,
                      child: Center(
                        child: Text('Reviews', style: GoogleFonts.inter(color: review ? Colors.white : Color(kcolor))),
                      ),
                      decoration: BoxDecoration(
                        color: review ? Color(kcolor) : Colors.white,
                        border: Border.all(color: Color(kcolor)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        des = false;
                        specs = true;
                        review = false;
                      });
                    },
                    child: Container(
                      height: Get.height * 0.03,
                      width: Get.width * 0.25,
                      child: Center(
                        child: Text('Specifications', style: GoogleFonts.inter(color: specs ? Colors.white : Color(kcolor))),
                      ),
                      decoration: BoxDecoration(
                        color: specs ? Color(kcolor) : Colors.white,
                        border: Border.all(color: Color(kcolor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: des,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.desCription, style: GoogleFonts.inter(fontSize: 12, color: Colors.black)),
              ),
            ),
            Visibility(
              visible: review,
              child: Container(
                width: Get.width * 0.9,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Rating', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15)),
                        RatingBar.readOnly(
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          initialRating: 4,
                          maxRating: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Select Size', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Color(kcolor))),
                ],
              ),
            ),
            ShoeSizeSelector(
              onSelectSize: (size) {
                selectedSize = size;
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Select Quantity', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Color(kcolor))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Color(kcolor)),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text(
                    '$quantity',
                    style: GoogleFonts.inter(fontSize: 15, color: Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Color(kcolor)),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomButton(
                onTap: () async {
                  if (selectedSize.isNotEmpty) {
                    Order order = Order(
                      name: widget.name,
                      price: widget.price,
                      size: selectedSize,
                      quantity: quantity,
                      image: widget.image,
                    );
                    controller.addToCart(order);
                    Get.to(CartScreen());
                  } else {
                    Get.snackbar('Select Size', 'Please Select Size', colorText: Color(kcolor));
                  }
                },
                title: 'Add to Cart',
              ),
            ),


          ],
        ),
      ),
    );
  }
}
