import 'package:amazon_clone/common/widgets/CustomButton.dart';
import 'package:amazon_clone/common/widgets/textformfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Navigator.pushNamed(context, '/home');
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Bharat Bazaar"),
          backgroundColor: Color.fromARGB(255, 255, 230, 189),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 20),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 20,
            //     ),
            //     Text(
            //       "Welcome to Bharat Bazaar",
            //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            //     ),

            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: Colors.orange,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  //? nullable
                  setState(() {
                    _auth = val!; //! non null
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: "Sign Up", onTap: () {})
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: Colors.orange,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  //? nullable
                  setState(() {
                    _auth = val!; //! non null
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: "Sign In", onTap: () {})
                    ],
                  ),
                ),
              ),
          ],
        )));
  }
}
