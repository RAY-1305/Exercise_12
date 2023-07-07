import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final Widget? suffixicon;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final bool readOnly;

  const MyTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.suffixicon,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? '',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 44,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextField(
            keyboardType: textInputType,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: suffixicon,
            ),
            onEditingComplete: onEditingComplete,
            onTap: onTap,
            readOnly: readOnly,
            onTapOutside: (pointer) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
