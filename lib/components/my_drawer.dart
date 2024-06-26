import 'package:flutter/material.dart';
import 'package:smarthomeui/components/my_drawer_tile.dart';
import 'package:smarthomeui/pages/add_emission_page.dart';
import 'package:smarthomeui/pages/assistance_page.dart';
import 'package:smarthomeui/pages/meta_mask_wallet_page.dart';
import 'package:smarthomeui/pages/quota.dart';
import 'package:smarthomeui/pages/redeem_page.dart';
import 'package:smarthomeui/pages/settings_page.dart';
import 'package:smarthomeui/screen/splash_screen.dart';

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

          const SizedBox(height: 10),

          // Progress/Quota
          MyDrawerTile(
            text: "M Y  P R O G R E S S",
            icon: Icons.bar_chart,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuotaPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 10),

          // carbon footprint list title
          MyDrawerTile(
            text: "M Y CO₂ F O O T P R I N T",
            icon: Icons.workspaces_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEmissionPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 10),

          // Redeem list title
          MyDrawerTile(
            text: "R E D E E M",
            icon: Icons.redeem,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RedeemPage(),
                  ));
            },
          ),

          const SizedBox(height: 10),

          // Redeem list title
          MyDrawerTile(
            text: "M Y  C O U P O N S",
            icon: Icons.airplane_ticket_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MetaMaskWallet(),
                  ));
            },
          ),

          const SizedBox(height: 10),
          
          MyDrawerTile(
            text: "A S S I S T A N C E",
            icon: Icons.android,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AssistancePage(),
                ),
              );
            },
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

          const Spacer(),

          // logout list title
          MyDrawerTile(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
