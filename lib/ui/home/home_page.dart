import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_mgmt_test/ui/home/home_controller.dart';
import 'package:state_mgmt_test/ui/home/home_page_states.dart';
import 'package:state_mgmt_test/utils/factory.dart';
import 'package:state_mgmt_test/utils/state_listener.dart';

class HomePage extends StatelessWidget {
  final homeController = Factory.read(() => HomeController());
  HomePage({super.key});

  Color _getColor(HomePageState state) {
    if (state is RedHomePageState) {
      return Colors.red;
    } else if (state is GreenHomePageState) {
      return Colors.green;
    } else if (state is BlueHomePageState) {
      return Colors.blue;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.refresh,
        ),
        onPressed: () {
          final random = Random();
          final nextInt = random.nextInt(3);
          print('NEXT TIN: $nextInt');
          if (nextInt == 0) {
            homeController.state = RedHomePageState();
          } else if (nextInt == 1) {
            homeController.state = GreenHomePageState();
          } else {
            homeController.state = BlueHomePageState();
          }
        },
      ),
      body: StateListener<HomePageState>(
        listener: homeController.stream,
        builder: (context, value) {
          print('VALUE IS ${value.runtimeType}');
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: _getColor(value),
          );
        },
      ),
    );
  }
}
