//
// import 'package:flutter/material.dart';
//
// class AppDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Categories',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             title: Text('Women'),
//             onTap: () {
//               // Handle tapping Women category
//               Navigator.pop(context); // Close the drawer
//               // You can navigate to a specific screen or execute other actions here
//             },
//             trailing: Icon(Icons.arrow_right),
//           ),
//           _buildSubCategories(['Shoes', 'Clothing', 'Accessories', 'Collaboration'],context),
//           ListTile(
//             title: Text('Men'),
//             onTap: () {
//               // Handle tapping Men category
//               Navigator.pop(context); // Close the drawer
//             },
//             trailing: Icon(Icons.arrow_right),
//           ),
//           _buildSubCategories(['Shoes', 'Clothing', 'Accessories', 'Collaboration'],context),
//           ListTile(
//             title: Text('Kids'),
//             onTap: () {
//               // Handle tapping Kids category
//               Navigator.pop(context); // Close the drawer
//             },
//             trailing: Icon(Icons.arrow_right),
//           ),
//           _buildSubCategories(['Shoes', 'Clothing', 'Accessories', 'Collaboration'],context),
//           ListTile(
//             title: Text('Technologies'),
//             onTap: () {
//               // Handle tapping Technologies category
//               Navigator.pop(context); // Close the drawer
//             },
//             trailing: Icon(Icons.arrow_right),
//           ),
//           _buildSubCategories(['Shoes', 'Clothing', 'Accessories', 'Collaboration'],context),
//           ListTile(
//             title: Text('Sale'),
//             onTap: () {
//               // Handle tapping Sale category
//               Navigator.pop(context); // Close the drawer
//             },
//             trailing: Icon(Icons.arrow_right),
//           ),
//           _buildSubCategories(['Shoes', 'Clothing', 'Accessories', 'Collaboration'],context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSubCategories(List<String> subCategories,BuildContext context) {
//     return Column(
//       children: subCategories.map((subCategory) {
//         return ListTile(
//           title: Text(subCategory),
//           onTap: () {
//             // Handle tapping subcategory
//             Navigator.pop(context); // Close the drawer
//             // You can navigate to a specific screen or execute other actions here
//           },
//           trailing: Icon(Icons.arrow_right),
//         );
//       }).toList(),
//     );
//   }
// }