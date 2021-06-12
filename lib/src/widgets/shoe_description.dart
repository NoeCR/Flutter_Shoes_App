import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDescription({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description, style: TextStyle(color: Colors.black54, height: 1.5)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
