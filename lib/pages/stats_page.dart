import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  //bottom bar variables
  int _currentBottomIndex = 0;
  late String currentDateText;
  late DateTime selectedDate;
  List<int> emissions = List.filled(4, 0);

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    currentDateText = _getCurrentDateText(selectedDate);
    _updateEmissions(selectedDate);
  }

  void _handleBottomIndexChange(int? index) {
    setState(() {
      _currentBottomIndex = index!;
    });
  }

  // padding constants
  final double verticalPadding = 25;

  List<List<dynamic>> deviceUsage = [
    // [ Date, Device1's Usage, Device2's Usage, Device3's Usage, Device4's Usage,  ]
    ["2024-03-22", 21, 18, 23, 17],
    ["2024-03-23", 20, 22, 16, 19],
    ["2024-03-24", 24, 15, 20, 18],
    ["2024-03-25", 16, 23, 17, 19],
    ["2024-03-26", 23, 20, 22, 15],
    ["2024-03-27", 19, 21, 18, 24],
    ["2024-03-28", 22, 17, 24, 21],
    ["2024-03-29", 18, 19, 15, 20],
    ["2024-03-30", 15, 24, 23, 17],
    ["2024-03-31", 16, 22, 17, 23],
    ["2024-04-01", 23, 18, 20, 22],
    ["2024-04-02", 24, 16, 21, 19],
    ["2024-04-03", 17, 20, 16, 24],
    ["2024-04-04", 20, 24, 19, 15],
    ["2024-04-05", 18, 23, 15, 21],
    ["2024-04-06", 15, 21, 24, 16],
  ];

  Map<DateTime, int> _generateHeatmapDataset() {
    Map<DateTime, int> heatMapData = {};

    deviceUsage.forEach((data) {
      DateTime date = DateTime.parse(data[0]);
      /* 
      The bottom two lines impact the calculation of the total device usage.
      Right now it's simply 100 - (sum of data)
      [TODO:] Update with formula
      */
      int totalDeviceUsage = data[1] + data[2] + data[3] + data[4];
      int calculatedValue = 100 - totalDeviceUsage;
      heatMapData[date] = calculatedValue;
    });

    return heatMapData;
  }

  // Function - Updates the date to the one corresponding to the icons inside the HeatMap
  String _getCurrentDateText(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Function - Updates the emissions to the one corresponding to the icons inside the HeatMap
  void _updateEmissions(DateTime date) {
    var data = deviceUsage.firstWhere(
        (element) =>
            element[0] ==
            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        orElse: () => []);
    if (data.isNotEmpty) {
      setState(() {
        emissions = List.from(data.sublist(1));
      });
    } else {
      setState(() {
        emissions = List.filled(4, 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STATS",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeatMap(
                  startDate: DateTime.now().subtract(const Duration(days: 14)),
                  endDate: DateTime.now().add(const Duration(days: 40)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  datasets: _generateHeatmapDataset(),
                  colorMode: ColorMode.opacity,
                  showText: true,
                  size: 25,
                  scrollable: true,
                  showColorTip: false,
                  colorsets: const {
                    1: Colors.green,
                  },
                  onClick: (value) {
                    setState(() {
                      selectedDate = value;
                      currentDateText = _getCurrentDateText(selectedDate);
                      _updateEmissions(selectedDate);
                    });
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16), // Remove padding on left
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Your Statistics: ${currentDateText}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.laptop),
                        const SizedBox(width: 8),
                        Text(
                          '${emissions[0]} ton CO2 emitted',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_android),
                        const SizedBox(width: 8),
                        Text(
                          '${emissions[1]} ton CO2 emitted',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.wind_power),
                        const SizedBox(width: 8),
                        Text(
                          '${emissions[2]} ton CO2 emitted',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(Icons.tv),
                        const SizedBox(width: 8),
                        Text(
                          '${emissions[3]} ton CO2 emitted',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
