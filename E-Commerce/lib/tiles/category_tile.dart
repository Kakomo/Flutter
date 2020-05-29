import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;
  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),
        ),
      title: Text(snapshot.data["title"],),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot)));},
    );
  }
}
