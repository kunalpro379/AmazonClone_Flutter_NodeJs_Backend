import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';

class BelowAppBar extends StatelessWidget {
  final String? username;
  final String helloText;
  final String? displayText; // New parameter to accept custom text
  final IconData? icon1; // Nullable icon for the starting side
  final IconData? icon2; // Nullable icon for the ending side

  const BelowAppBar({
    Key? key,
    this.username,
    this.helloText = 'Hello',
    this.displayText, // Initialized as null
    this.icon1, // Initialized as null
    this.icon2, // Initialized as null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Visibility(
      visible: username != null ||
          icon1 != null ||
          icon2 != null, // Show only if username or icons are provided
      child: Container(
        height: 70, // Set the height to 20
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 135, 255, 139),
              Color.fromARGB(255, 135, 255, 139),
              Color.fromARGB(255, 151, 255, 155),
              Color.fromARGB(255, 171, 253, 173),
              Color.fromARGB(255, 190, 255, 191),
              Color.fromARGB(255, 204, 255, 205),
              Color.fromARGB(255, 218, 253, 218),
              Color.fromARGB(255, 227, 255, 227),
              Color.fromARGB(255, 236, 255, 236),
              Color.fromARGB(255, 242, 253, 242),
              Color.fromARGB(255, 248, 255, 248),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Distribute icons evenly
          children: [
            Row(
              children: [
                if (icon1 != null) Icon(icon1),
                SizedBox(width: 8), // Add spacing between icon1 and text
                RichText(
                  text: TextSpan(
                    text: '$helloText ',
                    style: const TextStyle(
                      fontSize:
                          16, // Decreased font size to fit the smaller height
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: displayText ??
                            (username ??
                                user.name), // Use displayText if provided, otherwise use username or user's name
                        style: const TextStyle(
                            fontSize:
                                16, // Decreased font size to fit the smaller height
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (icon2 != null) Icon(icon2),
          ],
        ),
      ),
    );
  }
}
