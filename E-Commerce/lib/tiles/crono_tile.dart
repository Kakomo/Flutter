import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CronoTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CronoTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 400,
            child: Image.network(
              snapshot.data["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snapshot.data["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  snapshot.data["comentario"],
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text("Ver no Mapa",),
                textColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},${snapshot.data["long"]}")
                  ;                },
              ),
              FlatButton(
                child: Text("Ligar",),
                textColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("tel:${snapshot.data["phone"]}");
                },
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
