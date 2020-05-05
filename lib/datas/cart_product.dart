import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_dibello/datas/product_data.dart';

class CartProduct {

  String cid;


  String category;
  String pid;
  String observation;

  int quantity;
  String sizes;
  String description;

  ProductData productData;

  CartProduct();


  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
    sizes = document.data["sizes"];
    observation = document.data["observation"];
    description = document.data["description"];


  }


  Map<String, dynamic> toMap(){
    return {
      "category" : category,
      "pid" : pid,
      "quantity" : quantity,
      "sizes" :  sizes,
      "observation" : observation,
      "product" : productData.toResumedMap(),


    };
  }


}