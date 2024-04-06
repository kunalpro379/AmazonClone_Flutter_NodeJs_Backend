// import 'package:amazon_clone_tutorial/constants/global_variables.dart';
// import 'package:amazon_clone_tutorial/features/account/screens/account_screen.dart';
// import 'package:amazon_clone_tutorial/features/cart/screens/cart_screen.dart';
// import 'package:amazon_clone_tutorial/features/home/screens/home_screen.dart';
// import 'package:amazon_clone_tutorial/providers/user_provider.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BottomBar extends StatefulWidget {
//   static const String routeName = '/actual-home';
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _page = 0;
//   double bottomBarWidth = 42;
//   double bottomBarBorderWidth = 5;

//   List<Widget> pages = [
//     const HomeScreen(),
//     const AccountScreen(),
//     const CartScreen(),
//   ];

//   void updatePage(int page) {
//     setState(() {
//       _page = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userCartLen = context.watch<UserProvider>().user.cart.length;

//     return Scaffold(
//       body: pages[_page],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _page,
//         selectedItemColor: GlobalVariables.selectedNavBarColor,
//         unselectedItemColor: GlobalVariables.unselectedNavBarColor,
//         backgroundColor: GlobalVariables.backgroundColor,
//         iconSize: 28,
//         onTap: updatePage,
//         items: [
//           // HOME
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 0
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.home_outlined,
//               ),
//             ),
//             label: '',
//           ),
//           // ACCOUNT
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 1
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.person_outline_outlined,
//               ),
//             ),
//             label: '',
//           ),
//           // CART
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 2
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: Badge(
//                 elevation: 0,
//                 badgeContent: Text(userCartLen.toString()),
//                 badgeColor: Colors.white,
//                 child: const Icon(
//                   Icons.shopping_cart_outlined,
//                 ),
//               ),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../features/account/screens/account_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/menu/screens/MenuScreen.dart';
import '../../features/more/screens/MoreScreen.dart';

const _kPages = <String, IconData>{
  'Home': Icons.home,
  'You': Icons.person,
  'More': Icons.more_vert,
  'Cart': Icons.shopping_cart,
  'Menu': Icons.menu,
};
List<Widget> pages = [
  const HomeScreen(),
  const AccountScreen(),
  const CartScreen(),
  const MenuScreen(),
  const MoreScreen(),
];

class ConvexBottom extends StatefulWidget {
  const ConvexBottom({super.key});

  @override
  State<ConvexBottom> createState() => _ConvexBottomState();
}

class _ConvexBottomState extends State<ConvexBottom> {
  @override
  TabStyle _tabStyle = TabStyle.reactCircle;

  int page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  Widget build(BuildContext context) {
    return DefaultTabController(
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
          style: _tabStyle,
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
    );
  }
}
