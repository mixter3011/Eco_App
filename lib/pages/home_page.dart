import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/components/my_drawer.dart';
import 'package:smarthomeui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List mySmartDevices = [
  // [ smartDeviceName, iconPath, powerStatus, roomName ]
  ["Smart Light", "lib/icons/light-bulb.png", true, "Living Room"],
  ["Smart AC", "lib/icons/air-conditioner.png", false, "Bedroom"],
  ["Smart TV", "lib/icons/smart-tv.png", false, "Bedroom"],
  ["Smart Fan", "lib/icons/fan.png", false, "Living Room"],
];

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  /*
  [CHITRAKSH]: I have moved this list to the top of the file so I could access it in the devices_page.dart
  
  List mySmartDevices = [
    [ smartDeviceName, iconPath, powerStatus, roomName ]
    ["Smart Light", "lib/icons/light-bulb.png", true, "Living Room"],
    ["Smart AC", "lib/icons/air-conditioner.png", false, "Bedroom"],
    ["Smart TV", "lib/icons/smart-tv.png", false, "Bedroom"],
    ["Smart Fan", "lib/icons/fan.png", false, "Living Room"],
  ];
    
  */

  // power button switched

  /* 
  [TODO:] If I flip the switches on the home page, it reflects on the device page.
  But if I flip the switches on the device page, it doesn't reflect on the home page unless I hot reload using R.
  Need to figure out why that is.
  */
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
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}
