import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_dibello/datas/cart_product.dart';
import 'package:loja_dibello/datas/product_data.dart';
import 'package:loja_dibello/models/cart_model.dart';
import 'package:loja_dibello/models/user_model.dart';
import 'package:loja_dibello/screens/cart_screen.dart';
import 'package:loja_dibello/screens/login_screen.dart';
import 'package:loja_dibello/widgets/cart_button.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;


  ProductScreen(this.product);




  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {


  String sizes ;

  final ProductData product;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      floatingActionButton: CartButton(),
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 0.9,
              child: Carousel(
                images: product.images.map((url){
                return NetworkImage(url);
              }).toList(),
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotBgColor: Colors.transparent,
                dotColor: Colors.blueGrey,
                autoplay: false,
              ),

          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal
                  ),
                  maxLines: 3,

                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Tamanhos",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(

                  height: 40.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10.0,

                          childAspectRatio: 0.3
                      ),
                    children: product.sizes.map(
                        (s){
                          return GestureDetector(

                            onTap: (){
                              setState(() {
                                sizes = s;
                              });
                            },
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                    color: sizes == s ? Colors.red : Colors.black12,
                                    width: 2.0
                                )
                              ),
                              width: 50.0,
                              alignment: Alignment.center,
                              child: Text(s,style: TextStyle(fontWeight: FontWeight.bold),),

                            ),

                          );
                        }
                    ).toList(),
                  ),
                ),
                Divider(thickness: 5,),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                      onPressed: sizes != null ?
                      (){
                        if (UserModel.of(context).isLoggedIn()){
                          
                          CartProduct cartProduct = CartProduct();
                          cartProduct.sizes = sizes;
                          cartProduct.quantity = 1;
                          cartProduct.pid = product.id;
                          cartProduct.category = product.category;
                          cartProduct.productData = product;
                          
                          CartModel.of(context).addCartItem(cartProduct);

                          Navigator.of(context).push(
                              MaterialPageRoute(builder:(context) => CartScreen())
                          );

                        }
                        else
                          Navigator.of(context).push(
                            MaterialPageRoute(builder:(context) => LoginScreen())
                          );
                      } : null,
                      child: Text(UserModel.of(context).isLoggedIn()  ? "Adicionar ao Carrinho"
                        : "Entre para Comprar",
                      style: TextStyle(fontSize: 18.0),
                      ),
                      color: Colors.black,
                      textColor: Colors.white,
                      ),
                ),
                SizedBox(height: 16.0,),
                Text(
                  "Descrição:",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0
                  ),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
