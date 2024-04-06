import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/components/my_bottombar.dart';
import 'package:smarthomeui/components/my_drawer.dart';
import 'package:smarthomeui/themes/glassbox.dart';
import 'package:smarthomeui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bottom bar variables
  int _currentBottomIndex = 0;

  void _handleBottomIndexChange(int? index) {
    setState(() {
      _currentBottomIndex = index!;
    });
  }

  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", false],
    ["Haier LQT786", "lib/icons/air-conditioner.png", false],
    ["TLC 5V789", "lib/icons/smart-tv.png", true],
    ["NEXIS", "lib/icons/laptop.png", true],
    ["Xiaomi 11 Lite NE", "lib/icons/smartphone.png", true],
    ["WH-CH520", "lib/icons/music.png", false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: const MyDrawer(),
      body: // welcome home
          Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Home,",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sabyasachi',
                  style: GoogleFonts.bebasNeue(fontSize: 72),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),

          const SizedBox(height: 10),

          // smart devices grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Text(
              "Smart Devices",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // grid
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ),
          ),
          GlassBox(
            child: MyBottomBar(
                index: _currentBottomIndex, onTap: _handleBottomIndexChange),
          )
        ],
      ),
    );
  }
}
