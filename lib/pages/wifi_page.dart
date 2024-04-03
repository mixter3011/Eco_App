import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WifiPage extends StatelessWidget {
  const WifiPage({Key? key}) : super(key: key);

  // Method channel for communicating with native Android code
  static const platform = MethodChannel('com.example.wifi_page/wifi');

  // Function to launch Wi-Fi settings page
  void _launchWifiSettings() {
    try {
      platform.invokeMethod('launchWifiSettings');
    } on PlatformException catch (e) {
      print("Failed to launch Wi-Fi settings: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
              onPressed: () {
                // You can add functionality for the More button if needed
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Turn on Wi-Fi",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Wi-Fi is needed to discover and set up nearby devices",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 12),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed:
            _launchWifiSettings, // Call the function to launch Wi-Fi settings
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blue,
        ),
        child: Text(
          "Activate",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
