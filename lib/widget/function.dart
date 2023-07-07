// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//save info
void save(String name, String dob, String mail, String address, bool gender) {
  print('name: $name');
  print('dob: $dob');
  print('mail: $mail');
  print('adress: $address');
  print('gender: ${gender ? 'male' : 'female'}');
}


//showCupertinoModalPopup
void showDatePickerPopup(BuildContext context, DateTime selectedDate,
    Function(DateTime) onDateSelected) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Material(
        child: Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  maximumDate: DateTime.now(),
                  minimumDate: DateTime(
                    DateTime.now().year - 60,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                  onDateTimeChanged: (date) {
                    selectedDate = date;
                    print('selectedate1: $selectedDate');
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  onDateSelected(selectedDate);
                  Navigator.of(context).pop();
                  print('selectedate2: $selectedDate');
                },
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 19, 3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Xong',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
