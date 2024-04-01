// ignore_for_file: unused_import, must_be_immutable

/*
[CHITRAKSH] I built this mainly by taking up snippets from smart_device_box.dart and modifying the styling
*/

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartDeviceCard extends StatelessWidget {
  final String smartDeviceName;
  final String roomName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceCard({
    Key? key,
    required this.smartDeviceName,
    required this.roomName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: powerOn
                  ? Colors.grey[900]
                  : const Color.fromARGB(44, 164, 167, 189),
            ),
            child: Column(
              children: [
                Image.asset(
                  iconPath,
                  height: 65,
                  color: powerOn ? Colors.white : Colors.grey.shade700,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    powerOn ? 'Connected' : 'Disconnected',
                    style: TextStyle(
                      fontSize: 14,
                      color: powerOn ? Colors.green : Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    smartDeviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: powerOn
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFCDD2DA),
                    ),
                    child: Text(
                      roomName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // switch
          CupertinoSwitch(
            value: powerOn,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
