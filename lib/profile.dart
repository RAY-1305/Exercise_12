// ignore_for_file: avoid_print

import 'package:exercise/widget/avatar.dart';
import 'package:exercise/widget/function.dart';
import 'package:exercise/widget/gender.dart';
import 'package:exercise/widget/text_field.dart';
import 'package:exercise/widget/save_info_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool gender = true;
  DateTime selectedDate = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );

  void updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
      dobController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.center,
            child: Avatar(
              name: 'hoanganhquy',
              avartarUrl:
                  'https://lh3.googleusercontent.com/a/AAcHTtd7y1CevDMZtJOETlt7Ib6a60VhVwR8esnAUMWJ=s288-c-no',
              phone: '0906167090',
              isUpload: true,
            ),
          ),
          MyTextField(
            labelText: 'Họ & tên',
            hintText: 'Hoàng Anh A',
            controller: nameController,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  controller: dobController,
                  textInputType: TextInputType.none,
                  labelText: 'Ngày sinh',
                  hintText: DateFormat('dd/MM/yyyy').format(
                    DateTime(
                      DateTime.now().year - 18,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                  ),
                  suffixicon: const Icon(Icons.calendar_month),
                  onEditingComplete: () {
                    setState(() {
                      selectedDate =
                          DateFormat('dd/MM/yyyy').parse(dobController.text);
                    });
                  },
                  readOnly: true,
                  onTap: () {
                    showDatePickerPopup(
                        context, selectedDate, updateSelectedDate);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Gender(
                gender: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          MyTextField(
            controller: mailController,
            hintText: 'a@gmail.com',
            textInputType: TextInputType.emailAddress,
            labelText: 'Email (không bắt buộc)',
          ),
          const SizedBox(
            height: 15,
          ),
          MyTextField(
            controller: addressController,
            hintText: 'Hà Nội',
            textInputType: TextInputType.streetAddress,
            labelText: 'Địa chỉ',
          ),
          const SizedBox(
            height: 30,
          ),
          SaveinfoButton(
            onPressed: () {
              save(nameController.text, dobController.text, mailController.text,
                  addressController.text, gender);
            },
          ),
        ],
      ),
    );
  }
}
