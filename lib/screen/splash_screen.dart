// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smarthomeui/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("lib/assets/images/dynamic.gif"),
          const Text(
            " Trace your CO₂ \n     Footprints", 
            style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Poppins')
          ),
          const Text(
            " Become Energy \n        Efficient", 
            style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Poppins')
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SlideAction(
              borderRadius: 30,
              outerColor: Colors.grey.withOpacity(0.1),
              sliderButtonIcon: Image.asset(
                "lib/assets/images/atom icon.png",
                height: 20,
                width: 20,
              ),
              text: "Join the Movement",
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              onSubmit: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
