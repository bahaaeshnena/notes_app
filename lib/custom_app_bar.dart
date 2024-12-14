import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.isHome = true,
    required this.title,
  });
  final bool? isHome;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isHome!
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'JosefinSans', color: Colors.white, fontSize: 20),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/avatar.jpeg'),
        )
      ],
    );
  }
}
