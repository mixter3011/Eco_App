import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarthomeui/screen/splash_screen.dart';
import 'package:smarthomeui/pages/home_page.dart';
import 'package:smarthomeui/themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themData,
    );
  }
}
