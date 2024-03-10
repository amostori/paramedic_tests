import 'package:flutter/material.dart';

class OneRowPaint extends StatelessWidget {
  const OneRowPaint({super.key, required this.title, required this.descript});
  final String title;
  final String descript;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(child: Text(descript)),
              const Expanded(
                  child: Text(
                textAlign: TextAlign.center,
                '',
              )),
            ],
          ),
        ],
      ),
    );
  }
}
