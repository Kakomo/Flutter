import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/tiles/category_tile.dart';
import 'package:flutter/material.dart';

class ProdutosTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),),);
        else {
          var dividedTiles = ListTile.divideTiles(
            tiles: snapshot.data.documents.map((doc) {
              return CategoryTile(doc);
            },
            ).toList(),
            color: Color.fromARGB(255, 139, 204, 202),
          ).toList();

          return ListView(
            children:dividedTiles,
          );
        }
      },
    );
  }
}
