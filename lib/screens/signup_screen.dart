import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              // width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // svg image
                  Image.asset(
                    "assets/images/Insta.png",
                    height: 150,
                    fit: BoxFit.contain,
                    // color: Colors.amber,
                  ),
                  // circular avatar
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                      ),
                      Positioned(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo),
                        ),
                        bottom: -10,
                        left: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field username
                  TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: "Enter your username",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field email
                  TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field password
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: "Enter your password",
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field bio
                  TextFieldInput(
                    textEditingController: _bioController,
                    hintText: "Enter your bio",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      child: const Text("Sign up"),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: blueColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Dont have an account?  "),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
