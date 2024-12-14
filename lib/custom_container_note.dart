import 'package:flutter/material.dart';
import 'package:tasks_management_pp/const.dart';

class CustomContainerNote extends StatelessWidget {
  const CustomContainerNote({
    super.key,
    required this.title,
    required this.content,
    this.onTap,
  });
  final String title;
  final String content;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'JosefinSans',
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'JosefinSansLight',
              ),
              softWrap: true,
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
