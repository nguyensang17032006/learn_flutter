import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false, // tắt debug banner
      home: MyApp(),
    ),
  ); // entry point của app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod("Box 1", Alignment.bottomRight),
                  boxMethod("Box 2", Alignment.bottomLeft),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod("Box 3", Alignment.topRight),
                  boxMethod("Box 4", Alignment.topLeft),
                ],
              ),
            ],
          ),
          Center(child: boxMethod("Hello World!", Alignment.center, true)),
        ],
      ),
    );
  }

  Container boxMethod(
    String text,
    Alignment alignment, [
    bool boxRadient = false,
  ]) {
    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        color: boxRadient ? Colors.red : Colors.blue,
        borderRadius: BorderRadius.circular(boxRadient ? 200 : 0),
      ),
      width: 160,
      height: 160,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}
