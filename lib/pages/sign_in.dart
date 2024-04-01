import 'package:flutter/material.dart';
import 'package:smarthomeui/components/round_textfield.dart';
import 'package:smarthomeui/components/secondary_button.dart';
import 'package:smarthomeui/pages/sign_up.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("lib/assets/images/dynamic.gif"),
          RoundTextField(
              controller: txtEmail, hintText: "Email", obscureText: false, title: 'Email',),
          const SizedBox(
            height: 30,
          ),
          RoundTextField(
              controller: txtPassword, hintText: "Password", obscureText: true, title: 'Password',),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isRemember = !isRemember;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isRemember
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      size: 25,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password",
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SecondaryButton(
            title: "Sign In",
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SocialLoginView(),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "if you don't have an account yet?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          SecondaryButton(
            title: "Sign up",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
