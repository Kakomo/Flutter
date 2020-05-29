import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/login_screen.dart';
import 'package:docesnathally/tiles/order_tile.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(UserModel.of(context).isLoggedIn()){
      String uid = UserModel.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("users").document(uid).collection("orders").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return ListView(
              children: snapshot.data.documents.map((doc) =>OrderTile(doc.documentID)).toList().reversed.toList(),
            );
          }
        },
      );
    }else{
     return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,size: 80, color: Theme.of(context).primaryColor,),
            SizedBox(height: 16,),
            Text("Faça o Login para acompanhar!",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16,),
            RaisedButton(
              child: Text("Entrar",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        ),
      );
    }
  }
}
