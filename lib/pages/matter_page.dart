import 'package:flutter/material.dart';

class MatterPage extends StatefulWidget {
  const MatterPage({Key? key}) : super(key: key);

  @override
  State<MatterPage> createState() => _MatterPageState();
}

class _MatterPageState extends State<MatterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () {
              // Handle your menu action here
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Icon(Icons.qr_code_scanner_sharp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  "Scan Matter QR Code",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
                const SizedBox(height: 50), // Add spacing between text and box
                Container(
                  height: 350,
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0.8,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.transparent, // Adjust color as needed
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:100),
                        child: Icon(Icons.camera_alt_outlined, size: 40,),
                      ), // Replace with your desired icon
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            "Open Camera here",
                            style: TextStyle(fontFamily: "Poppins", color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5), // Add spacing between the square and the button
          Padding(
            padding: const EdgeInsets.only(right: 150.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), 
                    side: const BorderSide(color: Colors.grey, width: 0.5)
                  ),
                ),
              ),
              child: const Text(
                "Set up without QR code",
                style: TextStyle(fontFamily: "Poppins", color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
