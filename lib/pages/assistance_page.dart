import 'package:flutter/material.dart';

class AssistancePage extends StatefulWidget {
  const AssistancePage({Key? key}) : super(key: key);

  @override
  State<AssistancePage> createState() => _AssistancePageState();
}

class _AssistancePageState extends State<AssistancePage> {
  late bool _isPageLoaded;

  @override
  void initState() {
    super.initState();
    _isPageLoaded = false;
    // Simulate a delay for text generation
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isPageLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: _isPageLoaded
          ? SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "From the User's data I can infer the following:",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "1. Daily Fluctuations: There are fluctuations in CO2 emission rates from day to day for each device. These fluctuations could be due to varying usage patterns, environmental conditions, or operational factors.",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "2. Device Disparities: There are differences in emission rates among the four devices. Some devices consistently emit higher levels of CO2 than others. This could indicate variations in energy efficiency, maintenance issues, or differences in usage patterns.",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "3. Potential Trends: By analyzing the data over time, trends may emerge. For example, there may be an overall increase, decrease, or stability in emission rates over the observed period. Identifying trends can help in understanding the effectiveness of efforts to reduce carbon footprint or detect issues requiring attention.",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(), // Show a loading indicator while waiting
            ),
    );
  }
}
