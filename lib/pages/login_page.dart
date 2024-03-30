import 'package:flutter/material.dart';
import 'package:smarthomeui/components/primary_button.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/pages/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() {
    /*
    
    fill out Auth

    */

    // navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("lib/assets/images/dynamic.gif"),
          const Text(
            "     Sign in or Connect via your \n   preffered Home Connect App",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("lib/assets/images/apple_btn.png"),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/apple.png",
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Sign up with Apple Home Connect",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("lib/assets/images/google_btn.png"),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/images/google.png",
                    width: 15,
                    height: 15,
                    color: Colors.grey[900],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Sign up with Google Home",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "or",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 25,
          ),
          PrimaryButton(
            title: "Sign up with E-mail",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpView()));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
