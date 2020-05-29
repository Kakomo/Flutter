import 'package:docesnathally/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.shopping_cart, color: Colors.white,),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen())
          );
        },
    );
  }
}
