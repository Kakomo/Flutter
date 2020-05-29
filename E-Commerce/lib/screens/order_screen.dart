import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final String orderID;

  OrderScreen(this.orderID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Pedido Realizado!",style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check,color: Theme.of(context).primaryColor,size: 80,),
            Text("Pedido Realizado com Sucesso!",style: TextStyle(fontWeight:  FontWeight.bold,fontSize: 18),),
              Text("Código do seu Pedido :",style:TextStyle(fontSize: 16)),
              Text("$orderID",style:TextStyle(fontSize: 18,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold)),

          ],
        ),
      ),
    );
  }
}
