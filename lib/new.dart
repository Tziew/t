import 'package:flutter/material.dart';

void main() => runApp( MyApp());

/// main application widget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: (click == false)? Colors.amber : Colors.red ,
        appBar: AppBar(title: const Text('Demo')),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  click = !click ;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon((click == false) ? Icons.favorite : Icons.table_chart, size: 60),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
