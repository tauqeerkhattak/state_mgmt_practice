import 'package:flutter/material.dart';
import 'package:state_mgmt_test/ui/home/home_page.dart';

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
