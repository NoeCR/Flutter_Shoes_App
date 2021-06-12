import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/shoe_model.dart';
import 'src/pages/shoe_page.dart';

// void main() => runApp(MyApp());

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ShoeModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ShoePage(),
    );
  }
}
