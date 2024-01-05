import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/view-model/controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('History'),
          actions: [
            IconButton(
                onPressed: _controller.addRecord, icon: const Icon(Icons.add))
          ],
        ),
        body: Obx(() => ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(_controller.records[0].note!),
                Text(_controller.records[1].note!),
                Text(_controller.records[2].note!),
                Text(_controller.records[3].note!)
              ],
            )));
  }
}
