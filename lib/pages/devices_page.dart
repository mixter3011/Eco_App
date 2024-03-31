import 'package:flutter/material.dart';
import 'package:smarthomeui/util/smart_device_card.dart';
import 'package:smarthomeui/pages/home_page.dart' show mySmartDevices;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Devices"),
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
