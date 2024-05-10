import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/screens/analtyics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/AppBar.dart';
import '../../../common/widgets/bottom_bar.dart';

const _kPages = <String, IconData>{
  'Add Products': Icons.home,
  'Analytics': Icons.analytics_outlined,
  'Posts': Icons.post_add_outlined,
//  'Cart': Icons.shopping_cart,
  //'Menu': Icons.menu,
};
List<Widget> pages = [
  const PostsScreen(),
  const AnalyticsScreen(),
  const Text("Cart"),
];

TabStyle _tabStyle = TabStyle.reactCircle;

int page = 0;
double bottomBarWidth = 42;
double bottomBarBorderWidth = 5;

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56), // Typical AppBar height
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 135, 255, 139)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: MYAppBar(
              logoImagePath: 'assets/images/logo.png',
              logoWidth: 100,
              logoHeight: 50,
              appBarGradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 135, 255, 139)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              rightText: "Admin",
            ),
          ),
        ),
        body: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: Colors.white,
            drawerScrimColor: Colors.black,
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      for (final page in pages) page,
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: ConvexAppBar.badge(
              const <int, int>{3: 10},
              //  style: _tabStyle,
              // Show a badge count of 10 on index 3 ('Cart' item)
              //  backgroundColor: Color.fromARGB(255, 0, 255, 174),
              badgeBorderRadius: 5,

              shadowColor: Color.fromARGB(255, 255, 0, 0),
              gradient: LinearGradient(
                colors: [
                  // Color.fromARGB(255, 50, 0, 58),
                  // Color.fromARGB(255, 45, 0, 83),
                  // Color.fromARGB(255, 0, 14, 86),
                  // Color.fromARGB(255, 0, 34, 83),
                  // Color.fromARGB(255, 0, 29, 72),
                  Color.fromARGB(255, 0, 63, 52),
                  Color.fromARGB(255, 0, 65, 72),
                  Color.fromARGB(255, 0, 48, 72),
                  Color.fromARGB(255, 0, 41, 72),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              items: <TabItem>[
                for (final entry in _kPages.entries)
                  TabItem(
                    icon: entry.value,
                    title: entry.key,
                  ),
              ],
              onTap: (int i) => print('click index=$i'),
            ),
          ),
        ));
  }
}
