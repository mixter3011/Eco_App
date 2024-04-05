// ignore_for_file: must_be_immutable, unused_import

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedeemCard extends StatefulWidget {
  final String brandName;
  final String cardDescription;
  final num cardPoints;
  final num coins;
  final String imagePath; // New parameter for image path
  void Function(bool)? onRedeem;

  RedeemCard({
    Key? key,
    required this.brandName,
    required this.cardDescription,
    required this.cardPoints,
    required this.coins,
    required this.imagePath, // Updated constructor to accept image path
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
          // User input image
          Column(
            children: [
              Image.asset(
                widget.imagePath, // Using the provided image path
                width: 65,
                height: 65,
                fit: BoxFit.cover,
              ),
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
                      fontFamily: "Poppins",
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
                      fontFamily: "Poo",
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
          // Button
          ElevatedButton(
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
              backgroundColor: widget.cardPoints <= widget.coins
                  ? Colors.black
                  : Colors.grey.withOpacity(0.25),
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
