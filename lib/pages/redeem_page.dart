// ignore_for_file: unnecessary_string_escapes

import 'package:smarthomeui/util/redeem_card.dart';
import 'package:flutter/material.dart';

/*
This page resets everytime you re-open it, considering I have defined the coins variable and initialised it inside the page itself.
*/

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

List giftCards = [
  // [ brandName, cardDescription, cardPoints ]
  ["lib/assets/images/digitalocean.png","Digital Ocean Credits", "Get services worth 50 dollars", 100],
  ["lib/assets/images/gucci-removebg-preview.png","GUCCI", "Upto ₹1000 cashback", 400],
  ["lib/assets/images/leetcode.png","Leet Coins", "Get upto 150 LeetCode Coins", 300],
  ["lib/assets/images/amazon-removebg-preview.png","Amazon Gift Voucher", "Gift Voucher worth ₹500", 200],
];

class _RedeemPageState extends State<RedeemPage> {
  /* 
  Example coins property, which shows how many coins the user has right now.
  Value is updated when the user redeems a gift card. Template/visual function added right now for it.
  Also affects the button's background color to show if a card is redeemable or not.
  */
  int coins = 500;

  void redeemCard(int cardPoints) {
    setState(() {
      coins -= cardPoints;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redeem"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 32.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.token, size: 48),
                ),
                const SizedBox(width: 12),
                Text(
                  "$coins coins", // use mutable variable
                  style: const TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: giftCards.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: RedeemCard(
                        imagePath: giftCards[index][0],
                        brandName: giftCards[index][1],
                        cardDescription: giftCards[index][2],
                        cardPoints: giftCards[index][3],
                        coins: coins,
                        onRedeem: (value) {
                          if (giftCards[index][3] <= coins) {
                            // User CAN redeem
                            redeemCard(giftCards[index][3]);
                          } else {
                            // User CANNOT Redeem
                            /* 
                            [TODO:]
                            Could add a better UI implementation on how to do this.
                            */
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Not enough coins!"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    if (index != giftCards.length - 1)
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
