import 'package:flutter/material.dart';

class SingleInfo extends StatelessWidget {
  const SingleInfo({super.key,required this.iconData,required this.infoText});
  final IconData iconData;
  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 28,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          infoText,
        ),
      ],
    );
  }
}
