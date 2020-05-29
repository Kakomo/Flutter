import 'package:docesnathally/models/cart_model.dart';
import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/login_screen.dart';
import 'package:docesnathally/screens/order_screen.dart';
import 'package:docesnathally/tiles/cart_tile.dart';
import 'package:docesnathally/widgets/cart_price.dart';
import 'package:docesnathally/widgets/discount_card.dart';
import 'package:docesnathally/widgets/ship_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Meu Carrinho",style: TextStyle(color: Colors.white),),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context,child,model){
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "DOCE" : "DOCES"}", style: TextStyle(fontSize: 17,color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model){
          if(model.isLoading && UserModel.of(context).isLoggedIn()){
            return Center(child: CircularProgressIndicator(),
            );
          }else if(!UserModel.of(context).isLoggedIn()){
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_shopping_cart,size: 80, color: Theme.of(context).primaryColor,),
                  SizedBox(height: 16,),
                  Text("Faça o Login para adicionar ao Carrinho!",
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
          }else if(model.products == null || model.products.length == 0){
            return Center (child: Text("Nenhum Produto no Carrinho",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),);
          }else{
            return ListView(
              children: [
                Column(
                  children: model.products.map((product){
                    return CartTile(product);
                  },
                  ).toList(),
                ),
                DiscountCard(),
                ShipCard(),
                CartPrice(() async{
                  String orderID = await model.finishOrder();
                  if(orderID != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OrderScreen(orderID)));
                  }
                }),
              ],
            );
          }
        }
      ),
    );
  }
}
