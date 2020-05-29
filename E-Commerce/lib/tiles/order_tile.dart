import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
class OrderTile extends StatelessWidget {

  final String orderID;

  OrderTile(this.orderID);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance.collection("orders").document(orderID).snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }else{
              int status = snapshot.data["status"];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Codigo do Pedido: ${snapshot.data.documentID}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4,),
                  Text(
                      _buildProductsText(snapshot.data)
                  ),
                  SizedBox(height: 4,),
                  Text("Status do Pedido:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    _buildCircle("1", "Preparação", status, 1),
                    Container(height: 1,width: 40,color: Colors.grey[500],),
                    _buildCircle("2", "Transporte", status, 2),
                    Container(height: 1,width: 40,color: Colors.grey[500],),
                    _buildCircle("3", "Entrega", status, 3),
                  ],
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      Share.share("Acabei de Finalizar meu Pedido no seu novo Aplicativo! "
                          "\n Segue meu pedido: ${_buildProductsText(snapshot.data)}");
                    },
                    child: Text("Nos Envie via WhatsApp!!!",style: TextStyle(color: Colors.white),),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
  String _buildProductsText(DocumentSnapshot snapshot){
    String text = "Descrição: \n";
    for(LinkedHashMap p in snapshot.data["products"]){
      text +="${p["quantity"]} x ${p["product"]["title"]} (R\$ ${p["product"]["price"].toStringAsFixed(2)})\n";
    }
    text += "Total: R\$ ${snapshot.data["totalPrice"].toStringAsFixed(2)}";
    return text;
  }
  Widget _buildCircle(String title, String subtitle, int status, int thisStatus){
    Color backColor;
    Widget child;
    if(status< thisStatus){
      backColor =  Colors.grey[500];
      child = Text(title,style: TextStyle(color: Colors.white),);
    }else if(status == thisStatus){
      backColor =  Colors.blueAccent;
      child = Stack(
        alignment: Alignment.center,
        children: [
        Text(title,style: TextStyle(color: Colors.white)),
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    }else{
      backColor = Colors.green;
      child = Icon(Icons.check,color: Colors.white,);
    }
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: backColor,
          child: child,
        ),
        Text(subtitle),
      ],
    );
  }
}
