import 'package:flutter/material.dart';
import 'package:smarthomeui/pages/login_page.dart';

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
            style: TextStyle(color: Colors.white, fontSize: 45, fontFamily: 'Poppins'),
          ),
          const Text(
            " Become Energy \n        Efficient",
            style: TextStyle(color: Colors.white, fontSize: 45, fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "lib/assets/images/atom icon.png",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Join the Movement",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
