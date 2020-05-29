import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/models/cart_model.dart';
import 'package:flutter/material.dart';
class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: ExpansionTile(
        title: Text("Local de Entrega", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey[700]),),
        leading: Icon(Icons.location_on),
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Sobradinho, Sobradinho 2, Império, Nova Colina, Grande Colorado",
                  border: OutlineInputBorder(),
                  hintText: "Sobradinho, Sobradinho 2, Império, Nova Colina, Grande Colorado "
              ),
              initialValue: CartModel.of(context).local ?? "",
              onFieldSubmitted: (text){
                Firestore.instance.collection("locais").document(text).get().then((docSnap){
                  if(docSnap.data !=null){
                    CartModel.of(context).setFrete(text, docSnap.data["preco"]);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Frete de ${docSnap.data["preco"]} Reais adicionado!"),backgroundColor: Theme.of(context).primaryColor,)
                    );
                  }else{
                    CartModel.of(context).setFrete(null, 0);
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Local não cadastrado"),backgroundColor: Colors.redAccent,)
                    );
                  }
                });

              },
            ),
          ),
        ],
      ),
    );
  }
}
