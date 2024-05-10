// import 'package:amazon_clone_tutorial/constants/global_variables.dart';
// import 'package:amazon_clone_tutorial/features/account/widgets/below_app_bar.dart';
// import 'package:amazon_clone_tutorial/features/account/widgets/orders.dart';
// import 'package:amazon_clone_tutorial/features/account/widgets/top_buttons.dart';
// import 'package:flutter/material.dart';

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset(
//                   'assets/images/amazon_in.png',
//                   width: 120,
//                   height: 45,
//                   color: Colors.black,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: Row(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.only(right: 15),
//                       child: Icon(Icons.notifications_outlined),
//                     ),
//                     Icon(
//                       Icons.search,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         children: const [
//           BelowAppBar(),
//           SizedBox(height: 10),
//           TopButtons(),
//           SizedBox(height: 20),
//           Orders(),
//         ],
//       ),
//     );
//   }
// }

import 'package:amazon_clone/common/widgets/AppBar.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../widgets/top_buttons.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';
import '../../../common/widgets/AppBar.dart';
import '../../../providers/user_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MYAppBar(
          logoImagePath: 'assets/images/logo.png',
          logoWidth: 120,
          logoHeight: 45,
          icon1: Icons.notifications,
          icon2: Icons.search,
          appBarGradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 135, 255, 139)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppBar(
            displayText: null,
            icon1: null,
            icon2: null,
            helloText: "Hello ",
            username: user.name,
          ),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 10),
          Order(),
        ],
      ),
    );
  }
}
