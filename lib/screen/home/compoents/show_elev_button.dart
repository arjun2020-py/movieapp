import 'package:flutter/material.dart';

class ShowElvButton extends StatelessWidget {
  ShowElvButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.width,
      required this.icons
      });
  final String text;
  final Color bgColor;
  final double width;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: bgColor),
        icon: Icon(icons),
        onPressed: () {},
        label: Text(text),
      ),
    );
  }
}
