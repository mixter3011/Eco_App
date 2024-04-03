import 'package:flutter/material.dart';
import 'package:smarthomeui/pages/gnest_page.dart';
import 'package:smarthomeui/pages/matter_page.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
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
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Center(
              child: Text(
                "Choose a device",
                style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
              ),
            ),
          ),
          const SizedBox(height: 25),
          _buildDeviceOptionRow(
            icon: Padding(
              padding: const EdgeInsets.only(left: 34.5),
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('lib/icons/matter.png')),
            ),
            label: "Matter-enabled device",
            subtext: "Add devices with the Matter logo",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MatterPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          _buildDeviceOptionRow(
            icon: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('lib/icons/google_nest_hub-512.webp')),
            ),
            label: "Google Nest or partner device",
            subtext:
                "Add Nest devices, Chromecast, Google\nAssistant-enabled devices or partner devices\nlabelled 'Seamless Setup with the Google\nHome app'",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GoogleNestPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          _buildDeviceOptionRow(
            icon: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('lib/icons/google-assistant-icon.webp')),
            ),
            label: "Works with Google Home",
            subtext:
                "Link existing devices or services labelled 'Works\nwith Google Home'",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceOptionRow(
      {required Widget icon,
      required String label,
      String subtext = "",
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontFamily: "Poppins"),
                ),
                if (subtext.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0), // Adjust top padding for spacing
                    child: Text(
                      subtext,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
