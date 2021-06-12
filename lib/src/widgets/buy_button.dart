import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double width;
  final double height;
  final double opacity;

  const BuyButton(
      {required this.text, this.backgroundColor = Colors.orange, this.width = 150, this.height = 50, this.opacity = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
