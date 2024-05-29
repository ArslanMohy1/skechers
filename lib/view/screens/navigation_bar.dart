import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skechers/controller/cart_controller.dart';
import 'package:skechers/view/screens/Cart_Screen.dart';
import 'package:skechers/view/screens/catagory.dart';
import 'package:skechers/view/screens/homepage.dart';
import 'package:skechers/view/screens/order_screen.dart';
import 'package:skechers/view/screens/profile.dart';
import 'package:skechers/view/screens/reward.dart';
import 'package:skechers/view/screens/setting_screen.dart';
import 'package:skechers/view/utils/constant.dart';
class BottomBar extends StatefulWidget {

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final CartController controller = Get.put(CartController());
  List Screens=[
    HomePage(),
    Catagories(),
    OrderScreen(),
    RewardScreen(),
   SettingScreen(),
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Do you really want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ?? false;
      },
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          key: _bottomNavigationKey,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home,color: Color(kcolor),),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.category,color: Color(kcolor),),
              label: 'Catagories',
            ),
            CurvedNavigationBarItem(
              child: Icon(CupertinoIcons.bag_fill,color: Color(kcolor),),
              label: 'Orders',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.star,color: Color(kcolor),),
              label: 'Reward',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.settings,color: Color(kcolor),),
              label: 'Setting',
            ),

          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body:Screens[_page],
      ),
    );
  }
}
