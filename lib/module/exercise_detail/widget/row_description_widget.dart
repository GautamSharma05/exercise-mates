import 'package:flutter/material.dart';

class RowDescriptionWidget extends StatelessWidget {
  final String heading;
  final String data;
  const RowDescriptionWidget({super.key, required this.heading, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(data)
      ],
    );
  }
}
