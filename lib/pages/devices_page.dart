// ignore_for_file: unused_import, undefined_shown_name

import 'package:flutter/material.dart';
import 'package:smarthomeui/pages/add_device_page.dart';

import 'package:smarthomeui/pages/home_page.dart' show HomePage, mySmartDevices;
import 'package:smarthomeui/util/smart_device_card.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", false, "Bedroom"],
    ["Haier LQT786", "lib/icons/air-conditioner.png", false, "Bedroom"],
    ["TLC 5V789", "lib/icons/smart-tv.png", true, "Bedroom"],
    ["NEXIS", "lib/icons/laptop.png", true, ""],
    ["Xiaomi 11 Lite NE", "lib/icons/smartphone.png", true, ""],
    ["WH-CH520", "lib/icons/music.png", false, ""],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(child: Text("Smart Devices")),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDevicePage()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mySmartDevices.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: SmartDeviceCard(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        roomName: mySmartDevices[index][3],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      ),
                    ),
                    if (index != mySmartDevices.length - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 204, 204, 204),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
