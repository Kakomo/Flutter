import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "RPG1",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _for = 0;
  int _dex = 0;
  int _con = 0;
  int _int = 0;
  int _sab = 0;
  int _car = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "imagem/sheet.png",
          fit: BoxFit.fill,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Força:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_for++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_for--;});},
                ),
              ],
            ),
            Text(
              "$_for",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
            Text(
              "Destreza:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_dex++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_dex--;});},
                ),
              ],
            ),
            Text(
              "$_dex",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
            Text(
              "Contituição:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_con++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_con--;});},
                ),
              ],
            ),
            Text(
              "$_con",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
            Text(
              "Intelignência:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_int++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_int--;});},
                ),
              ],
            ),
            Text(
              "$_int",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
            Text(
              "Sabedoria:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_sab++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_sab--;});},
                ),
              ],
            ),
            Text(
              "$_sab",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
            Text(
              "Carisma:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("+1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_car++;});},
                ),
                FlatButton(
                  child: Text("-1",
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  onPressed: () {setState(() {_car--;});},
                ),
              ],
            ),
            Text(
              "$_car",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0),
            ),
          ],
        ),
      ],
    );
  }
}
