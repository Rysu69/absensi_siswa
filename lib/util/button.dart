import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  const MyButton1({
    super.key,
    required this.color,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(5),
        child: const Center(child: Text("Tap")),
      ),
    );
  }
}
