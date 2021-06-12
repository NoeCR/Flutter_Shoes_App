import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                'For You',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
