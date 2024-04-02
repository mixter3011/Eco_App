import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smarthomeui/pages/add_emission_page.dart' show emissions;

/*
This is the modal which pops up when you press the + button on the Add Emission page. 
Potential rework of the UI for this but not the primary focus right now.
*/

class AddEmissionModal extends StatefulWidget {
  final void Function(String, double) onAddEmission;
  const AddEmissionModal({Key? key, required this.onAddEmission})
      : super(key: key);
  @override
  _AddEmissionModalState createState() => _AddEmissionModalState();
}

class _AddEmissionModalState extends State<AddEmissionModal> {
  String selectedOption = 'Food';
  double sliderValue = 5;
  void Function(bool)? onAddEmission;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16, left: 12),
              child: Text(
                'Add Emission Manually',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16, left: 12),
                    child: Text(
                      'Emission Type',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CupertinoSegmentedControl<String>(
                    selectedColor: Colors.black,
                    borderColor: Colors.black,
                    children:
                        Map.fromEntries(emissions.map((emission) => MapEntry(
                            emission[0],
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(emission[0]),
                            )))),
                    groupValue: selectedOption,
                    onValueChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 12),
                    child: Text(
                      'Emission Level',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      '${sliderValue.toDouble().toStringAsFixed(1)} tons of CO₂',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    label: 'Test',
                    value: sliderValue,
                    min: 1,
                    max: 20,
                    divisions: null,
                    onChanged: (newValue) {
                      setState(() {
                        sliderValue = newValue;
                      });
                    },
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onAddEmission(selectedOption, sliderValue);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add Emission',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
