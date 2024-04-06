import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  late bool success;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void sendPostRequest() async {
    final url = Uri.parse('http://192.168.33.204:8181/api/auth/register/');
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

      if (response.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        print('Post Request Successful');
        print('Response: ${response.body}');
        setState(() {
          success = true;
        });
      } else {
        print('Failed to send Post request');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          success = false;
        });
      }
    } catch (e) {
      print('Error sending Post request: $e');
      setState(() {
        success = false;
      });
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
              sendPostRequest();
              if (success == true) {
                Navigator.pop(context);
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
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              }
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
