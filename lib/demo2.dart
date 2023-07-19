import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  double result = 0;

  void calculate(Operation operation) {
    setState(() {
      switch (operation) {
        case Operation.add:
          result = num1 + num2;
          break;
        case Operation.subtract:
          result = num1 - num2;
          break;
        case Operation.multiply:
          result = num1 * num2;
          break;
        case Operation.divide:
          result = num1 / num2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextField(
              decoration: InputDecoration(labelText: 'Số 1'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  num1 = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Số 2'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  num2 = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => calculate(Operation.add),
              child: Text('Cộng'),

            ),
            ElevatedButton(
              onPressed: () => calculate(Operation.subtract),
              child: Text('Trừ'),
            ),
            ElevatedButton(
              onPressed: () => calculate(Operation.multiply),
              child: Text('Nhân'),
            ),
            ElevatedButton(
              onPressed: () => calculate(Operation.divide),
              child: Text('Chia'),

            ),
            SizedBox(height: 16),
            Text(
              'Kết quả: $result',
              style: TextStyle(fontSize: 30),
            ),
            Image.network(
              'https://xwatch.vn/upload_images/images/2023/05/22/anh-meme-la-gi.jpg',
              width: 120,
              height: 200,
            ),
          ],

        ),
      ),
    );
  }
}

enum Operation { add, subtract, multiply, divide }
