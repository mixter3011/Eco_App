import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:smarthomeui/util/add_emission_model.dart';

class AddEmissionPage extends StatefulWidget {
  const AddEmissionPage({Key? key}) : super(key: key);

  @override
  State<AddEmissionPage> createState() => _AddEmissionPageState();
}

List emissions = [
  // [ emissionType, emissionValue ]
  ["Food", 0.0],
  ["Electricity", 0.0],
  ["Vehicle", 0.0],
  ["Purchases", 0.0],
];

class _AddEmissionPageState extends State<AddEmissionPage> {
  Map<String, double> emissionData = {
    for (var emission in emissions) emission[0]: emission[1]
  };
  /* 
  Example emissions property.
  Initialised to the sum of all emissions in the emissions list.
  */
  double emissionsValue = 0;
  /* 
  [CHITRAKSH]
  Took help for this but raw implementation to display the date as Month, YYYY.
  We can look into instead using a better implementation for this if required.
  */
  String formatMonthYear(DateTime date) {
    final monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final month = monthNames[date.month];
    final year = date.year;

    return '$month, $year';
  }

// Function: Add emission
  void addEmission(String emissionType, double emissionValue) {
    setState(() {
      emissionValue = double.parse(emissionValue.toStringAsFixed(1));
      int index =
          emissions.indexWhere((emission) => emission[0] == emissionType);
      emissions[index][1] += emissionValue;
      calculateEmissionsValue();
      // Not including this broke live updation of the pie chart idk why lol
      emissionData = {for (var emission in emissions) emission[0]: emission[1]};
    });
  }

  // Function: Calculate total emissions value
  void calculateEmissionsValue() {
    setState(() {
      emissionsValue = emissions.fold(0, (prev, element) => prev + element[1]);
      emissionsValue = double.parse(emissionsValue.toStringAsFixed(1));
    });
  }

  @override
  void initState() {
    super.initState();
    calculateEmissionsValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD EMISSION",style: TextStyle(fontFamily: "Poppins"),),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatMonthYear(
                      DateTime.parse(DateTime.now().toString().split(' ')[0])),
                  style: const TextStyle(fontSize: 24, fontFamily: "Poppins"),
                ),
                Row(
                  children: [
                    const Icon(Icons.factory, size: 48),
                    const SizedBox(width: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$emissionsValue ",
                          style: const TextStyle(fontSize: 48, fontFamily: "Poppins"),
                        ),
                        const Text(
                          "ton CO₂",
                          style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: PieChart(
              dataMap: emissionData,
              animationDuration: const Duration(milliseconds: 500),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 30,
              centerText: "$emissionsValue",
              centerTextStyle: const TextStyle(
                  fontSize: 36,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              colorList: [
                /* 
                [TODO:]
                Figure out better colour scheme to go with the app's theme.
                Just using the black and grey shades looked confusing.
                */
                Colors.green.shade200,
                Colors.green.shade400,
                Colors.green.shade600,
                Colors.green.shade800,
              ],
              legendOptions: const LegendOptions(
                showLegends: true,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
                showChartValueBackground: false,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
                chartValueStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var emission in emissions)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Row(
                    children: [
                      const Icon(Icons.eco, size: 20),  
                      const SizedBox(width: 8),
                      Text(
                        '${emission[0]} Emissions:',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${emission[1].toStringAsFixed(1)}',
                        style: const TextStyle(fontSize: 16, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0,
            right: 8.0,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return AddEmissionModal(onAddEmission: addEmission);
                  },
                );
              },
              backgroundColor: Colors.black,
              elevation: 0,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
