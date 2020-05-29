import 'package:carousel_pro/carousel_pro.dart';
import 'package:docesnathally/datas/cart_product.dart';
import 'package:docesnathally/datas/product_data.dart';
import 'package:docesnathally/models/cart_model.dart';
import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
class ProductScreen extends StatefulWidget {

  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;
  String tipo;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        title: Text(product.title,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(aspectRatio: 1.3,
          child: Carousel(
            images: product.images.map((url){
                return NetworkImage(url);
            }).toList(),
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotBgColor: Colors.transparent,
            dotColor: Theme.of(context).primaryColor,
            autoplay: false,
          ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),maxLines: 3,),
                Text("R\$ ${product.price.toStringAsFixed(2)}",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                SizedBox(height: 16,),
                Text("Tipo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height: 34,
                  child:GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.3,
                    ),
                    children: product.tipo.map((s){return GestureDetector(
                      onTap: (){
                        setState(() {
                          tipo = s;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: s == tipo ? Theme.of(context).primaryColor : Colors.grey[500],width: 3),

                        ),
                        width: 50,
                        alignment: Alignment.center,
                        child: Text(s),
                      ),
                    );}).toList(),
                  ),
                ),
                SizedBox(height: 16,),
                SizedBox(width: 44,
                child:RaisedButton(
                  onPressed: tipo != null ? (){
                    if(UserModel.of(context).isLoggedIn()){
                      CartProduct cartProduct = CartProduct();
                      //adicionar ao carrinho
                      cartProduct.tipo = tipo;
                      cartProduct.quantity = 1;
                      cartProduct.pid = product.id;
                      cartProduct.category = product.category;
                      cartProduct.productData = product;

                      CartModel.of(context).addCartItem(cartProduct);

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>CartScreen())
                      );

                    } else{
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen())
                      );
                    }
                  } : null,
                  child: Text(UserModel.of(context).isLoggedIn() ? "Adicionar ao Carrinho"
                    : "Entre para Comprar!",style: TextStyle(fontSize: 18),),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                ),
                SizedBox(height: 16,),
                Text("Descrição",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                Text(product.description,style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
