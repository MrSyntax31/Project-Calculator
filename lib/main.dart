import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XXX Calculator",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "*" ||
        btntext == "/") {
      firnum = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secondnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (firnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firnum - secondnum).toString();
      }
      if (operationtoperform == "*") {
        res = (firnum * secondnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btntext).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(35.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
