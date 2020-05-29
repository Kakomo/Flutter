import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/datas/product_data.dart';

class CartProduct{
  String cid;

  String category;
  String pid;

  int quantity;
  String tipo;

  ProductData productData;
  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category =document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    tipo = document.data["tipo"];
  }

  Map <String, dynamic> toMap(){
    return{
      "category": category,
      "pid": pid,
      "quantity":quantity,
      "tipo":tipo,
      "product": productData.toResumedMap()
    };
  }
}