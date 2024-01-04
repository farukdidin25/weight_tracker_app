import 'package:flutter/material.dart';
import 'package:weight_tracker_app/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  const Text('History'),),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile()
        ],
      )
    );
  }
}