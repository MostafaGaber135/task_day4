import 'package:flutter/material.dart';
import 'package:task_day4/screens/select_location_screen.dart';
// import 'package:task_day4/screens/select_location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SelectLocationScreen.routeName: (context) => SelectLocationScreen(),
      },
      home: const SelectLocationScreen(),
      initialRoute: SelectLocationScreen.routeName,
    );
  }
}
