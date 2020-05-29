import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController forControler = TextEditingController();
  TextEditingController dexControler = TextEditingController();
  TextEditingController conControler = TextEditingController();
  TextEditingController intControler = TextEditingController();
  TextEditingController sabControler = TextEditingController();
  TextEditingController carControler = TextEditingController();

  String _infoFor ="Seu Habilit Mode é : ()";
  String _infoDex ="Seu Habilit Mode é : ()";
  String _infoCon ="Seu Habilit Mode é : ()";
  String _infoInt ="Seu Habilit Mode é : ()";
  String _infoSab ="Seu Habilit Mode é : ()";
  String _infoCar ="Seu Habilit Mode é : ()";

  void _resetField(){
    forControler.text = '';
    dexControler.text = '';
    conControler.text = '';
    intControler.text = '';
    sabControler.text = '';
    carControler.text = '';
    setState(() {
      _infoFor ="Seu Habilit Mode é : ()";
      _infoDex ="Seu Habilit Mode é : ()";
      _infoCon ="Seu Habilit Mode é : ()";
      _infoInt ="Seu Habilit Mode é : ()";
      _infoSab ="Seu Habilit Mode é : ()";
      _infoCar ="Seu Habilit Mode é : ()";
    });


  }

  void calFor() {
    setState(() {
      int forca = int.parse(forControler.text);
      int habFor = ((forca / 2) - 5).toInt();
     _infoFor = "Seu Habilit Mode é : ($habFor)";
      print(habFor);
    });
  }
  void calDex() {
    setState(() {
      int dex = int.parse(dexControler.text);
      int habDex = ((dex / 2) - 5).toInt();
      _infoDex ="Seu Habilit Mode é : ($habDex)";
    });

  }
  void calCon() {
    setState(() {
      int con = int.parse(conControler.text);
      int habCon = ((con/2) - 5).toInt();
      _infoCon ="Seu Habilit Mode é : ($habCon)";
    });

  }
  void calInt() {
    setState(() {
      int intel = int.parse(intControler.text);
      int habInt = ((intel/2) - 5).toInt();
      _infoInt ="Seu Habilit Mode é : ($habInt)";
    });
  }
  void calSab() {
    setState(() {
      int sab = int.parse(sabControler.text);
      int habSab = ((sab/2) - 5).toInt();
      _infoSab ="Seu Habilit Mode é : ($habSab)";
    });
  }
  void calCar() {
    setState(() {
      int car = int.parse(carControler.text);
      int habCar = ((car/2) - 5).toInt();
      _infoCar ="Seu Habilit Mode é : ($habCar)";
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPG2"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetField,
          )
        ],
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.grey),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Força(kg)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: forControler ,
            ),
            RaisedButton(
              onPressed: calFor,
              child: Text(_infoFor, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),


            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Destreza(Km/h)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: dexControler ,
            ),
            RaisedButton(
              onPressed:calDex,
              child: Text(_infoDex, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Constituição(Kcal)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: conControler ,
            ),
            RaisedButton(
              onPressed:calCon,
              child: Text(_infoCon, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Inteligência(QI)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: intControler ,
            ),
            RaisedButton(
              onPressed:calInt,
              child: Text(_infoInt, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Sabedoria(anos)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: sabControler ,
            ),
            RaisedButton(
              onPressed:calSab,
              child: Text(_infoSab, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Carisma(seguidores)",
                  labelStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              controller: carControler ,
            ),
            RaisedButton(
              onPressed:calCar,
              child: Text(_infoCar, style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),

          ],
        ),
      ),
    );
  }
}
