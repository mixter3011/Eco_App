import 'package:flutter/material.dart';
import 'package:smarthomeui/pages/wifi_page.dart';

class GoogleNestPage extends StatefulWidget {
  const GoogleNestPage({Key? key}) : super(key: key);

  @override
  State<GoogleNestPage> createState() => _GoogleNestPageState();
}

class _GoogleNestPageState extends State<GoogleNestPage> {
  int? selectedTileIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Choose a home",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "You will be able to control the devices and services in this\n                                              home",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      selectedTileIndex = 0;
                    });
                  },
                  leading: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: selectedTileIndex == 0
                        ? Container(
                            width: 65,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            key: UniqueKey(),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 65,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            key: UniqueKey(),
                            child: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  title: Text(
                    '木の葉',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: selectedTileIndex == 0
                          ? Colors.blue
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  subtitle: Text(
                    "Sector31, Plot No.281 Fourth Floor Faridabad, Haryana",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      color: selectedTileIndex == 0
                          ? Colors.blue
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      selectedTileIndex = 1;
                    });
                  },
                  leading: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: selectedTileIndex == 1
                        ? Container(
                            width: 65,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            key: UniqueKey(),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 65,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            key: UniqueKey(),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  title: Text(
                    'Add another home',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: selectedTileIndex == 1
                          ? Colors.blue
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WifiPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius as needed
          ),
          backgroundColor:
              Colors.blue, // Set the background color for the button
        ),
        child: Text(
          'Next',
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Adjust the location of the button
    );
  }
}
