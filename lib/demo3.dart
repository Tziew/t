import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  //  runApp(Center(child: Text("Hello App Flutter" , textDirection: TextDirection.rtl,) ,));
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter App Demo",
        theme:ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,),
        home: MyHomePage(title: "Calculator",));
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  dynamic result = 0;
  TextEditingController _textEditingControllerSoA = TextEditingController();
  TextEditingController _textEditingControllerSoB = TextEditingController();
  static const int CONG = 0;
  static const int TRU = 1;
  static const int NHAN = 2;
  static const int CHIA = 3;

  void _calculate(int type) {
    if(_textEditingControllerSoA.text==""){
      showMess("Vui lòng nhập số ");
      return ;
    }
    if(_textEditingControllerSoB.text==""){
      showMess("Vui lòng nhập số ");
      return ;
    }
    // Moi nguoi bat them cac truong hop xay ra nua

    setState(() {

      switch (type) {
        case CONG:
          result = int.parse(_textEditingControllerSoA.text) +  int.parse(_textEditingControllerSoB.text);
          break;
        case TRU:
          result = int.parse(_textEditingControllerSoA.text) -  int.parse(_textEditingControllerSoB.text);
          break;
        case NHAN:
          result = int.parse(_textEditingControllerSoA.text) * int.parse(_textEditingControllerSoB.text);
          break;
        case CHIA:
          result = int.parse(_textEditingControllerSoA.text) / int.parse(_textEditingControllerSoB.text);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/ic_calculator.jpg",width: 150, height: 150,),
            Container().customContainer(TextField().customTF("Nhập số A",_textEditingControllerSoA)),
            Container().customContainer(TextField().customTF("Nhập số B",_textEditingControllerSoB)),
            Container().customContainer(Center(child :Text("Kết quả " + '$result' , textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18.0),))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(color: Colors.blue, child: Text("+",style: TextStyle(color: Colors.white),),onPressed: (){
                  _calculate(CONG);
                },),
                RaisedButton(color: Colors.red, child: Text("-",style: TextStyle(color: Colors.white),),onPressed: (){
                  _calculate(TRU);
                }),
                RaisedButton(color: Colors.green, child: Text("x",style: TextStyle(color: Colors.white),),onPressed: (){
                  _calculate(NHAN);
                }),
                RaisedButton(color: Colors.orange, child: Text(":",style: TextStyle(color: Colors.white),),onPressed: (){
                  _calculate(CHIA);
                }),

              ],)

          ],
        ),
      ),
    );
  }

  void showMess(String mess){
    Toast.show(mess, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
  }
}

extension ExtTextField on TextField {
  TextField customTF(String title, TextEditingController controllerET) => TextField(
    controller: controllerET,
    decoration: new InputDecoration(
        hintText: title,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          //  when the TextFormField in unfocused
        ) ,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          //  when the TextFormField in focused
        ) ,
        border: UnderlineInputBorder(
        )
    ),
    keyboardType: TextInputType.number,
    obscureText: false,
  );
}

/*extension ExtButton on RaisedButton {
   RaisedButton customRaisedButton(String text , Color color) => RaisedButton(
      onPressed: onPressed,
      disabledColor: color,
      color: color,
      child: Text(text,style: TextStyle(color: Colors.white),),);
}*/



extension ExtContainer on Container{
  Container customContainer(Widget widget) => Container(
    width: 200.0,
    child: widget,
    height: 40.0,
  );
}


