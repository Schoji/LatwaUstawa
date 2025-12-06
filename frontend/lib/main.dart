import 'package:flutter/material.dart';
import 'package:latwe_ustawy/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LatwaUstawa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Geist',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Geist'),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.red.shade300,
          surfaceContainerLow: Color.fromARGB(255, 13, 13, 13),
          surfaceContainerHigh: Color.fromARGB(255, 21, 21, 21),
          onPrimaryContainer: Color.fromARGB(13, 72, 72, 72),
          onSurfaceVariant: Colors.white.withAlpha(150),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      ),

      home: HomePage(),
    );
  }
}
