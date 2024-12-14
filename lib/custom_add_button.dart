import 'package:flutter/material.dart';
import 'package:tasks_management_pp/const.dart';

class CustomButtonAdd extends StatelessWidget {
  const CustomButtonAdd({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: const Text('Save',
            style: TextStyle(
                color: Colors.white, fontFamily: 'JosefinSans', fontSize: 20)),
      ),
    );
  }
}
