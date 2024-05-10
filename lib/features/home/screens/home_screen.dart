// import 'package:amazon_clone_tutorial/constants/global_variables.dart';
// import 'package:amazon_clone_tutorial/features/home/widgets/address_box.dart';
// import 'package:amazon_clone_tutorial/features/home/widgets/carousel_image.dart';
// import 'package:amazon_clone_tutorial/features/home/widgets/deal_of_day.dart';
// import 'package:amazon_clone_tutorial/features/home/widgets/top_categories.dart';
// import 'package:amazon_clone_tutorial/features/search/screens/search_screen.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 42,
//                   margin: const EdgeInsets.only(left: 15),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       onFieldSubmitted: navigateToSearchScreen,
//                       decoration: InputDecoration(
//                         prefixIcon: InkWell(
//                           onTap: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                               left: 6,
//                             ),
//                             child: Icon(
//                               Icons.search,
//                               color: Colors.black,
//                               size: 23,
//                             ),
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.only(top: 10),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.black38,
//                             width: 1,
//                           ),
//                         ),
//                         hintText: 'Search Amazon.in',
//                         hintStyle: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.transparent,
//                 height: 42,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: const Icon(Icons.mic, color: Colors.black, size: 25),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: const [
//             AddressBox(),
//             SizedBox(height: 10),
//             TopCategories(),
//             SizedBox(height: 10),
//             CarouselImage(),
//             DealOfDay(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/AppBar.dart';
import '../../../providers/user_provider.dart';
import '../widgets/carousel_image.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MYAppBar(
          icon1: null,
          icon2: Icons.mic,
          logoImagePath: null, //'assets/images/logo.png',
          // logoWidth: 100,
          // logoHeight: 50,
          appBarGradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 135, 255, 139)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          leadingIcon: Icon(Icons.notifications_outlined),
          textFieldController: TextEditingController(),
        ),
      ),
      // body: Center(
      //   child: Text('${user.toJson()}'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BelowAppBar(
              displayText: "Delivery to ${user.name} - ${user.address}",
              icon1: Icons.location_on_outlined,
              icon2: Icons.arrow_drop_down,
              helloText: "",
              username: "",
            ),
            const SizedBox(
              height: 12,
            ),
            // AddressBox(),
            // SizedBox(height: 10),
            TopCategories(),
            // SizedBox(height: 10),
            CarouselImage(),
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
