// ignore_for_file: avoid_types_as_parameter_names, avoid_print

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/graph.dart';
import 'package:weight_tracker_app/history.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentTab = 0;
  Widget _currentScreen = const GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("TRACK YOUR WEIGHT")),
      //body: GraphScreen(),
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child:  const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height / 12,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          backgroundColor: Colors.black,
          icons: const [Icons.show_chart, Icons.history],
          iconSize: 30,
          activeIndex: _currentTab,
          onTap: (int) {
            setState(() {
              _currentTab=int;
              _currentScreen = (int==0)? GraphScreen(): HistoryScreen();
            });
            
          }),
    );
  }
}
