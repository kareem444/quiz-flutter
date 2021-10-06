import 'package:flutter/material.dart';
import 'package:quiz/color.dart';
import 'package:quiz/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'شغل عقلك'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: isSwitched,
                onChanged: (val) {
                  setState(() {
                    isSwitched = val;
                    if (val == true) {
                      b = Colors.white;
                      b54 = Colors.white60;
                      w = Colors.black;
                    } else {
                      b = Colors.black;
                      b54 = Colors.black54;
                      w = Colors.white;
                    }
                  });
                },
                activeColor: Colors.amber,
              ),
              Row(
                children: [
                  Text(
                    widget.title,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Icon(
                      Icons.directions_run,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Home());
  }
}
