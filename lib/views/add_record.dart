import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();

  void pickDate(BuildContext context) async {
    var initialDate = DateTime.now();
    _selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: initialDate.subtract(const Duration(days: 365)),
          lastDate: initialDate.add(const Duration(days: 30)),
          builder: (context, child) {
            return Theme(
                data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme(
                        brightness: Brightness.light,
                        primary: Colors.black87,
                        onPrimary: Colors.grey,
                        secondary: Colors.yellow,
                        onSecondary: Colors.yellowAccent,
                        error: Colors.red,
                        onError: Colors.orange,
                        background: Colors.blueAccent,
                        onBackground: Colors.blueGrey,
                        surface: Colors.blue,
                        onSurface: Colors.black26)),
                child: child ?? const Text(''));
          },
        ) ??
        _selectedDate;

    if (kDebugMode) {
      print(_selectedDate.toIso8601String());
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Record'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: deprecated_member_use
                  const Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.weight,
                    size: 40,
                  ),
                  Stack(alignment: Alignment.bottomCenter, children: [
                    NumberPicker(
                      itemCount: 3,
                      itemHeight: 50,
                      itemWidth: 80,
                      step: 1,
                      axis: Axis.horizontal,
                      minValue: 40,
                      maxValue: 130,
                      value: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                    ),
                    const Icon(
                      FontAwesomeIcons.chevronUp,
                      size: 16,
                    )
                  ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                        child: Text(
                      DateFormat('EEE,MMM D').format(_selectedDate),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Text('Note Card'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Save Record'),
          ),
        ],
      ),
    );
  }
}
