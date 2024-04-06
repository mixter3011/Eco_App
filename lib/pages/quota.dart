import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuotaPage extends StatefulWidget {
  const QuotaPage({Key? key}) : super(key: key);

  @override
  State<QuotaPage> createState() => _QuotaPageState();
}

class _QuotaPageState extends State<QuotaPage> {
  late String currentDataText;
  late DateTime selectedDate;
  List<int> emissions = List.filled(4, 0);
  late double
      usageCO2; // Remove final, as it's not initialized in the constructor
  late final double avgdailyenergyconsumptionofphone;
  late final double avgdailyenergyconsumptionofac;
  late final double avgdailyenergyconsumptionoftv;
  late final double avgdailyenergyconsumptionoflaptop;
  final double carbonintensity = 2249;
  final double tvhours;
  final double achours;
  final double phonehours;
  final double laptophours;
  late double
      totalhours; // Remove final, as it's not initialized in the constructor
  late double totalavgenergy;
  final double powerrattingtv;
  final double powerrattingac;
  final double powerrattinglaptop;
  final double powerrattingphone;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    currentDataText = _getCurrentDateText(selectedDate);
    _updateEmissions(selectedDate);
  }

  // padding constants
  final double verticalPadding = 25;

  List<List<dynamic>> deviceUsage = [
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
      int totalDeviceUsage = data[1] + data[2] + data[3] + data[4];
      int calculatedValue = 100 - totalDeviceUsage;
      heatMapData[date] = calculatedValue;
    });

    return heatMapData;
  }

  String _getCurrentDateText(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

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

  _QuotaPageState({
    this.avgdailyenergyconsumptionofphone = 0.0,
    this.avgdailyenergyconsumptionofac = 0.0,
    this.avgdailyenergyconsumptionoftv = 0.0,
    this.avgdailyenergyconsumptionoflaptop = 0.0,
    this.achours = 3,
    this.laptophours = 14,
    this.phonehours = 10,
    this.powerrattingac = 1440,
    this.powerrattinglaptop = 60,
    this.powerrattingphone = 33,
    this.powerrattingtv = 45,
    this.tvhours = 3,
  });

  double calculateaveragetvconsumption() {
    return powerrattingtv * tvhours;
  }

  double calculateaverageacconsumption() {
    return powerrattingac * achours;
  }

  double calculateaveragephoneconsumption() {
    return powerrattingphone * phonehours;
  }

  double calculateaveragelaptopconsumption() {
    return powerrattinglaptop * laptophours;
  }

  double calculatetotalaverageenrfy() {
    totalavgenergy = calculateaverageacconsumption() +
        calculateaveragelaptopconsumption() +
        calculateaveragephoneconsumption() +
        calculateaveragetvconsumption();
    return totalavgenergy;
  }

  double calculatetotalhours() {
    totalhours = tvhours + achours + laptophours + phonehours;
    return totalhours;
  }

  double calculatetotalCO2usage() {
    usageCO2 = (calculatetotalaverageenrfy() *
            calculatetotalhours() *
            carbonintensity) /
        1000000000;
    return usageCO2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "YOUR PROGRESS",
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "DAILY QUOTA: 100 UNITS",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 34),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 160),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20,
                  percent: calculatetotalCO2usage(),
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade200,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: HeatMap(
                    startDate: DateTime.now().subtract(const Duration(days: 14)),
                    endDate: DateTime.now().add(const Duration(days: 40)),
                    margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    datasets: _generateHeatmapDataset(),
                    colorMode: ColorMode.opacity,
                    showText: true,
                    size: 25,
                    scrollable: true,
                    showColorTip: false,
                    colorsets: const {
                      7: Colors.green,
                    },
                    onClick: (value) {
                      setState(() {
                        selectedDate = value;
                        currentDataText = _getCurrentDateText(selectedDate);
                        _updateEmissions(selectedDate);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
