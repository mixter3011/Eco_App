// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smarthomeui/components/round_textfield.dart';
import 'package:smarthomeui/components/secondary_button.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/pages/sign_up.dart';
import 'package:http/http.dart' as http;

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final bool success;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;
  void sendPostRequest() async {
    final url = Uri.parse('http://192.168.33.204:8181/api/auth/login/');
    print(txtEmail.text);
    print(txtPassword.text);
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            json.encode({"email": txtEmail.text, "password": txtPassword.text}),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        print('Post Request Succesful');
        print('Response: ${response.body}');
        success = true;
      } else {
        print('Failed to send Post request');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        success = false;
      }
    } catch (e) {
      print('Error sending Post request: $e');
    }
  }

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
            controller: txtPassword,
            hintText: "Password",
            obscureText: true,
            title: 'Password',
          ),
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
              sendPostRequest();
              if (success == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("There was an error logging in"),
                      actions: <Widget>[
                        TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("OK"))
                      ],
                    );
                  },
                );
              }
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
