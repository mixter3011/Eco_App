import 'package:flutter/material.dart';
import 'package:smarthomeui/components/my_drawer_tile.dart';
import 'package:smarthomeui/pages/settings_page.dart';
import 'package:smarthomeui/pages/devices_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list title
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings list title
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          // devices list title
          MyDrawerTile(
            text: "D E V I C E S",
            icon: Icons.devices,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DevicesPage(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "T R A C K E R",
            icon: Icons.add_chart_rounded,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "R E D E E M",
            icon: Icons.card_giftcard_sharp,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          // logout list title
          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: () {}),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
