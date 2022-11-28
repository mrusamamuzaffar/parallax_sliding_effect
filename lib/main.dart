import 'package:flutter/material.dart';
import 'package:parallax_sliding_effect/parallax_sliding_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parallax Sliding Effect Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ParallaxSlidingEffect(
        image: AssetImage('assets/1.jpg'),
        width: 340,
        height: 240,
      ),
    );
  }
}
