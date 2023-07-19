import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _textControllerA = TextEditingController();
  final TextEditingController _textControllerB = TextEditingController();
  final TextEditingController _textControllerResult = TextEditingController();

  double _a = 0;
  double _b = 0;
  double _result = 0;

  void _calculate(String operation) {
    setState(() {
      _a = double.tryParse(_textControllerA.text) ?? 0;
      _b = double.tryParse(_textControllerB.text) ?? 0;

      switch (operation) {
        case 'add':
          _result = _a + _b;
          break;
        case 'subtract':
          _result = _a - _b;
          break;
        case 'multiply':
          _result = _a * _b;
          break;
        case 'divide':
          _result = _a / _b;
          break;
      }

      _textControllerResult.text = _result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Dart'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller: _textControllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số a',
              ),
            ),
            TextField(
              controller: _textControllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số b',
              ),
            ),
            SizedBox(height: 16.0,),
            TextField(
              controller: _textControllerResult,
              decoration: const InputDecoration(
                labelText: 'Kết quả',
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: const Text('/'),
                ),
                SizedBox(height:16,),
                Image.network('https://xwatch.vn/upload_images/images/2023/05/22/anh-meme-la-gi.jpg',
                  height: 200,
                  width: 120,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}