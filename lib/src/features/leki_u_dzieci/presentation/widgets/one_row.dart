import 'package:flutter/material.dart';

class OneRow extends StatelessWidget {
  const OneRow({super.key, required this.title, required this.descript});
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
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(
                child: Text(
                  descript,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
