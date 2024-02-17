import 'package:flutter/material.dart';

class HomeListButton extends StatelessWidget {
  const HomeListButton({super.key, required this.onTap, required this.title});
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(title),
        ),
      ),
    );
  }
}
