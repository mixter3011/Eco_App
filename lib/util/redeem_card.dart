// ignore_for_file: unused_import, must_be_immutable
/*
[CHITRAKSH] 
Rewritten version of smart_device_card.dart, but implements some frontend-coded functionality for the redeem functions.
Basic redeeming should work from a frontend perspective, using the app you'll know what I mean.
*/

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedeemCard extends StatefulWidget {
  final String brandName;
  final String cardDescription;
  final num cardPoints;
  final num coins;
  void Function(bool)? onRedeem;

  RedeemCard({
    Key? key,
    required this.brandName,
    required this.cardDescription,
    required this.cardPoints,
    required this.coins,
    required this.onRedeem,
  }) : super(key: key);

  @override
  _RedeemCardState createState() => _RedeemCardState();
}

class _RedeemCardState extends State<RedeemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon
          Column(
            children: [
              Icon(Icons.card_giftcard_rounded,
                  size: 65,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brandName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.cardDescription,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.token,
                        size: 16,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.cardPoints} points',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // button
          ElevatedButton(
            /* 
            [CHITRAKSH]
            Template function which implements the event which happens when the button is pressed
            */
            onPressed: () {
              if (widget.cardPoints <= widget.coins) {
                if (widget.onRedeem != null) {
                  widget.onRedeem!(true);
                }
              } else {
                if (widget.onRedeem != null) {
                  widget.onRedeem!(false);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              /* 
              [TODO:]
              Identify appropriate colours to implement theme-provided colour scheme for enabled & disabled button.
              */
              backgroundColor: widget.cardPoints <= widget.coins
                  ? Colors.black
                  : Colors.grey,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'REDEEM',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
