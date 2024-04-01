import 'package:flutter/material.dart';
import 'package:smarthomeui/components/round_textfield.dart';
import 'package:smarthomeui/components/secondary_button.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/pages/sign_in.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("lib/assets/images/dynamic.gif"),
          RoundTextField(
            controller: txtEmail,
            hintText: "Email",
            obscureText: false,
            title: 'Email',
          ),
          const SizedBox(
            height: 30,
          ),
          RoundTextField(
            controller: txtEmail,
            obscureText: true,
            title: 'Password',
            hintText: 'Password',
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "       Use 8 or more characters with a mix of letters, numbers & symbols.",
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          SecondaryButton(
            title: "Get started, it's free!",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          const Text(
            "Do you have already an account?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          SecondaryButton(
            title: "Sign in",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
