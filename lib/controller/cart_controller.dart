import 'package:get/get.dart';
import 'package:skechers/model/order_model.dart';
import 'package:skechers/view/screens/place_order.dart';
import 'package:skechers/view/utils/db_helper.dart';

class CartController extends GetxController {
  var orders = <Order>[].obs;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() async {
    List<Order> fetchedOrders = await DatabaseHelper.instance.getOrders();
    orders.assignAll(fetchedOrders);
    calculateTotalPrice();
  }

  void updateQuantity(int index, int newQuantity) async {
    Order updatedOrder = orders[index].copyWith(quantity: newQuantity);
    await DatabaseHelper.instance.updateOrder(updatedOrder);
    orders[index] = updatedOrder;
    calculateTotalPrice();
  }

  void removeOrder(int index) async {
    await DatabaseHelper.instance.deleteOrder(orders[index].id);
    orders.removeAt(index);
    calculateTotalPrice();
  }
Future<void> deletetable() async {
    await DatabaseHelper.instance.deletetable();
    fetchOrders();
}
  void calculateTotalPrice() {
    int total = 0;
    for (Order order in orders) {
      total += order.getTotalPrice();
    }
    totalPrice.value = total;
  }

  void placeOrder() {
    if(orders.isNotEmpty){
    Get.to(() => PlaceOrderScreen(orders: orders));}
    else{

    }
  }

  void addToCart(Order order) async {
    await DatabaseHelper.instance.insertOrder(order.toMap());
    fetchOrders();
  }
}
