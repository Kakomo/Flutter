import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/tiles/crono_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CronoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("cronograma").getDocuments(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.documents.map((doc) => CronoTile(doc)).toList(),
          );
        }
      }
    );
  }
}
