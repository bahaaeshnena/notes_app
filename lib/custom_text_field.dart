import 'package:flutter/material.dart';
import 'package:tasks_management_pp/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 100,
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'JosefinSans',
      ),
      decoration: InputDecoration(
        fillColor: secondColor,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff74778a),
          fontFamily: 'JosefinSans',
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xff74778a),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
