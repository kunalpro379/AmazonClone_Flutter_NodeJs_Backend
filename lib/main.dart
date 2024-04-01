import 'package:flutter/material.dart';
import 'package:amazon_clone/router.dart';

import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      onGenerateRoute: (settings) => generateRoute(settings),
      initialRoute: AuthScreen.routeName,
      home: const AuthScreen(),
    );
  }
}
