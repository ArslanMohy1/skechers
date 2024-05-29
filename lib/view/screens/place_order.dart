import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skechers/controller/cart_controller.dart';
import 'package:skechers/model/order_model.dart';
import 'package:skechers/view/screens/navigation_bar.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:get/get.dart';
import 'package:skechers/view/utils/db_helper.dart';
import 'package:skechers/view/widgets/custom_textfield.dart';

class PlaceOrderScreen extends StatefulWidget {
  final List<Order> orders;

  const PlaceOrderScreen({required this.orders});

  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final CartController controller = Get.put(CartController());


  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final TextEditingController _addressController = TextEditingController();
  String shippingAddress = '';
  String paymentMethod = 'Cash on Delivery (COD)';
  String cardNumber = '';
  String cardExpiry = '';
  String cardCVV = '';
  double shipping = 8.5;
  double tax = 0.00;
  bool isVoucher = false;
  Future<void> _loadProfile() async {
    final profile = await _dbHelper.getProfile();
    if (profile != null) {
      setState(() {

        shippingAddress= profile.address;

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadProfile();
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (Order order in widget.orders) {
      totalPrice += order.getTotalPrice();
    }
    return totalPrice;
  }

  void placeOrder() {

    if(shippingAddress.isNotEmpty && paymentMethod == 'Cash on Delivery (COD)') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Congratulation',style: TextStyle(color: Color(kcolor),fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Lottie.network('https://lottie.host/2c0506dc-37b0-4320-b1cf-248acc1d3ed2/UCHdvJTblh.json', repeat: false),

                const SizedBox(height: 10),


                Row(mainAxisAlignment: MainAxisAlignment.center,children: [MaterialButton(onPressed: (){

               controller.deletetable().then((value) => Get.to(const BottomBar()));
                },color: const Color(kcolor), child: Text('OK',style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),),],)
              ],

            ),
          );
        },
      );
    } else if(paymentMethod == 'Online Payment' && shippingAddress.isNotEmpty && cardCVV.isNotEmpty && cardNumber.isNotEmpty && cardExpiry.isNotEmpty ){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Congratulation',style: TextStyle(color: Color(kcolor),fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Lottie.network('https://lottie.host/2c0506dc-37b0-4320-b1cf-248acc1d3ed2/UCHdvJTblh.json', repeat: false),

                const SizedBox(height: 10),


                Row(mainAxisAlignment: MainAxisAlignment.center,children: [MaterialButton(onPressed: (){

                  _dbHelper.deletetable().then((value) => Get.to(const BottomBar()));
                },color: const Color(kcolor), child: Text('OK',style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),),],)
              ],

            ),
          );
        },
      );
    }
    else{
      Get.snackbar('Empty Fields', 'Please fill all the fiels to Continue');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 400.0), // To make space for the button
                    child: Column(
                      children: [

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              'Place Order',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color(kcolor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height*0.05,),
                        Container(

                          height: Get.height * (widget.orders.length/10),
                          child: Center(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.orders.length,
                              itemBuilder: (context, index) {
                                Order order = widget.orders[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      leading: Image.network(order.image),
                                      title: Text(order.name),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Price: \$${order.price}'),
                                          Text('Quantity: ${order.quantity}'),
                                          Text('Total: \$${order.getTotalPrice()}'),
                                          Text('Size:${order.size}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height*0.03,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Shipping Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),

                        CustomTextfield(
                          inputText: shippingAddress,
                          obsecure: false,
                          prefixIcon: Icons.local_shipping,

                          onChanged: (value) {
                           shippingAddress = value;
                           _updateShippingAddress(value);
                          },
                        ),
                        SizedBox(height: Get.height*0.01,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  DropdownButton<String>(
                                    value: paymentMethod,
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: const SizedBox.shrink(), // This hides the underline
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        paymentMethod = newValue!;
                                      });
                                    },
                                    items: <String>['Cash on Delivery (COD)', 'Online Payment']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  if (paymentMethod == 'Online Payment') ...[
                                    CustomTextfield(
                                      inputText: 'Card Number',
                                      obsecure: false,
                                      onChanged: (value) {
                                        cardNumber = value;
                                      },
                                      prefixIcon: Icons.credit_card,
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    CustomTextfield(
                                      inputText: 'Card Expiry Date (MM/YY)',
                                      obsecure: false,
                                      onChanged: (value) {
                                        cardExpiry = value;
                                      },
                                      prefixIcon: Icons.calendar_month,
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    CustomTextfield(
                                      inputText: 'Card CVV',
                                      obsecure: false,
                                      onChanged: (value) {
                                        cardCVV = value;
                                      },
                                      prefixIcon: Icons.lock,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){
                              setState(() {
                                isVoucher= !isVoucher;
                              });
                            }, child:Text('Do you have any voucher?',style: GoogleFonts.inter(
                              color: const Color(kcolor),
                            ),)),
                          ],
                        ),
                        Visibility(
                          visible: isVoucher,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height * 0.045,
                                  width: Get.width * 0.5,
                                  child: TextField(
                                    style: const TextStyle(color: Color(kcolor), fontSize: 15),
                                    decoration: InputDecoration(
                                      hintText: 'Voucher Code',
                                      hintStyle: const TextStyle(color: Color(kcolor)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.04),
                                Container(
                                  height: Get.height * 0.045,
                                  width: Get.width * 0.2,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: const Color(kcolor),
                                    child: Text(
                                      'Apply',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Order Summary',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(kcolor),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Subtotal:',
                                                style: TextStyle(fontSize: 16, color: Color(kcolor)),
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.04),
                                            Text(' \$${calculateTotalPrice()}'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Shipping:',
                                                style: TextStyle(fontSize: 16, color: Color(kcolor)),
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.04),
                                            const Text('Free'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Total cost',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(kcolor)),
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.04),
                                            Text(
                                              '\$${calculateTotalPrice()}',
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(kcolor)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: placeOrder,
                      color: const Color(kcolor),
                      child: Text(
                        'Place Order',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _updateShippingAddress(String address) async {
    // Update shipping address in the database
    final profile = await _dbHelper.getProfile();
    if (profile != null) {
      profile.address = address;
      await _dbHelper.updateProfile(profile);
    }
  }
}



