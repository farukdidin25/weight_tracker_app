// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/models/record.dart';
import 'package:weight_tracker_app/view-model/controller.dart';
import 'package:weight_tracker_app/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    RxList<Record> records = _controller.records;

    return Obx(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('History'),
          actions: [
            IconButton(
                onPressed: _controller.addRecord, icon: const Icon(Icons.add))
          ],
        ),
        body: records.isEmpty
            ? Center(
                child: Container(
                  child: const Text('Please Add Some Records'),
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: records
                    .map((record) => RecordListTile(record: record))
                    .toList())));
  }
}
