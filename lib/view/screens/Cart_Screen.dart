import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skechers/controller/cart_controller.dart';
import 'package:skechers/model/order_model.dart';
import 'package:skechers/view/utils/constant.dart';
import 'package:get/get.dart';
import 'package:skechers/view/widgets/custom_botton.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
SizedBox(height: Get.height*0.05,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.back),
                ),
                Text(
                  'Cart Screen',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(kcolor),
                  ),
                )
              ],
            ),
            Expanded(
              child: Obx(() {
                if (controller.orders.isEmpty) {
                  return Center(child: Text("Your cart is empty"));
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    Order order = controller.orders[index];
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
                              Text('Size: ${order.size}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Total: \$${order.getTotalPrice()}'),
                                  Row(

                                    children: [

                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          if (order.quantity > 1) {
                                            controller.updateQuantity(index, order.quantity - 1);
                                          } else {
                                            controller.removeOrder(index);
                                          }
                                        },
                                      ),
                                      Text('${order.quantity}'),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          controller.updateQuantity(index, order.quantity + 1);
                                        },
                                      ),
                                    ],
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    return Text(
                      'Total Price: \$${controller.totalPrice}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  }),
                ),
                CustomButton(
                  onTap: controller.placeOrder,
                  height: Get.height * 0.05,
                  width: Get.width * 0.3,
                  title: 'Check out',
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
