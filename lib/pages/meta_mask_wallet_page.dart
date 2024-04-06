import 'package:flutter/material.dart';

class MetaMaskWallet extends StatefulWidget {
  const MetaMaskWallet({Key? key}) : super(key: key);

  @override
  _MetaMaskWalletState createState() => _MetaMaskWalletState();
}

class _MetaMaskWalletState extends State<MetaMaskWallet> {
  String? selectedOption; // State variable to keep track of selected option

  // Options for the dropdown menu
  List<String> options = ['1WcM####UiP0', '1ZYO####8rsQ', 'fobic_27'];

  // Method to handle selection from the dropdown menu
  void _handleOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 60,
              height: 60,
              child: Image.asset("lib/assets/images/pic-removebg-preview.png"),
            ),
          ),
          const Positioned(
            top: 45,
            right: 30,
            child: CircleAvatar(
              radius: 28,
              backgroundImage:
                  AssetImage("lib/assets/images/profile_image.jpg"),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2 -
                80, // Centered horizontally
            child: GestureDetector(
              onTap: () {
                // Show dropdown menu
                showMenu<String>(
                  context: context,
                  position: RelativeRect.fromDirectional(
                    textDirection: TextDirection.ltr,
                    start: 150,
                    top: 85,
                    end: 150,
                    bottom: 10,
                  ), // Adjust position here
                  items: options.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Row(
                        children: [
                          const Icon(Icons.circle,
                              size: 10, color: Colors.grey), // Grey dot
                          const SizedBox(width: 5),
                          Text(option),
                        ],
                      ),
                    );
                  }).toList(),
                ).then((String? value) {
                  // Handle selected option
                  if (value != null) {
                    _handleOptionSelected(value);
                  }
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade500),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle,
                        size: 10, color: Colors.green), // Green dot
                    const SizedBox(width: 5),
                    Text(
                      selectedOption ?? 'fobic_27',
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_downward,
                        size: 16), // Smaller arrow down icon
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 125,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, left: 8),
                        child:
                            Icon(Icons.circle, size: 10, color: Colors.green),
                      ),
                      const SizedBox(width: 2),
                      const Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: Text('Connected',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontSize: 12)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, right: 8),
                        child: Text(
                          selectedOption ?? 'fobic_27',
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      IconButton(
                        onPressed: () {
                          // Handle menu button tap
                        },
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0.1, left: 108.5),
                    child: Row(
                      children: [
                        Text(
                          '9472d********0782',
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.content_copy,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 170,
            left: 20,
            right: 20,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Divider(
                height: 30,
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: MediaQuery.of(context).size.width / 2 - 116,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      const AssetImage("lib/assets/images/eth.png"),
                  backgroundColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 20),
                Text(
                  '0.073  ETH',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 0.5),
                Text(
                  '₹ 20,045.12',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle first circular button tap
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.call_received_outlined,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text("Received", style: TextStyle(fontFamily: "Poppins", color: Colors.blue),)
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle second circular button tap
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_outward_outlined,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text("Sell",style: TextStyle(fontFamily: "Poppins", color: Colors.blue, fontSize: 16),)
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle third circular button tap
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.swap_horiz_outlined,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text("Swap",style: TextStyle(fontFamily: "Poppins", color: Colors.blue, fontSize: 14),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.54,
            left: 20,
            right: 20,
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Assets'), // First tab
                      Tab(text: 'Activity'), // Second tab
                    ],
                    labelColor: Colors.blue,
                    indicatorColor: Colors.blue,
                    labelStyle: TextStyle(fontFamily: "Poppins"),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: TabBarView(
                      children: [
                        // Content for Assets tab
                        ListView(
                          children: [
                            _buildAssetItem(
                              backgroundImage: const AssetImage(
                                  "lib/assets/images/glass_image.png"),
                              imageProvider: const AssetImage(
                                  "lib/assets/images/bms-removebg-preview.png"),
                              text: 'Book My Show Coupon',
                              subText: 'Date: 2024-04-05\nQuantity: X 1',
                            ),
                            _buildAssetItem(
                              backgroundImage:
                                  const AssetImage("lib/assets/images/bg.jpg"),
                              imageProvider: const AssetImage(
                                  "lib/assets/images/amazon-removebg-preview.png"),
                              text: 'Amazon Gift Voucher',
                              subText: 'Date: 2024-04-06\nQuantity: X 2',
                            ),
                          ],
                        ),
                        // Content for Activity tab
                        ListView(
                          children: [
                            _buildActivityItem(
                              text: 'Receive',
                              subText: '+0.0012 ETH',
                              number: '+0.0718 ETH',
                            ),
                            _buildActivityItem(
                              text: 'Receive',
                              subText: '+0.0022 ETH',
                              number: '+0.0696 ETH',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetItem({
    required ImageProvider imageProvider,
    required String text,
    required String subText,
    required ImageProvider backgroundImage,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: imageProvider,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
              ),
              Text(
                subText,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required String text,
    required String subText,
    required String number,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue),
              ),
              child: const Icon(Icons.call_received,
                   color: Colors.blue)), // Grey dot
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Jul 6:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5), // Add spacing between texts
                  Text(
                    'From 0x9fd...e34d', // Additional text
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500, // Different color
                      fontSize: 11,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                subText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
