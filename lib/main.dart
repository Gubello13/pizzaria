import 'package:flutter/material.dart';
import 'package:loja_dibello/models/cart_model.dart';
import 'package:loja_dibello/models/user_model.dart';
import 'package:loja_dibello/screens/home_screen.dart';
import 'package:loja_dibello/screens/login_screen.dart';
import 'package:loja_dibello/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return ScopedModel<CartModel>(
              model: CartModel(model),
              child:  MaterialApp(

                  title: "Di Bello Pizzeria",
                  theme: ThemeData(
                      primarySwatch:  Colors.blue,
                      primaryColor: Colors.white
                  ),
                  debugShowCheckedModeBanner: false ,
                  home: HomeScreen()
              ),

            );

          }

      ),
    );
  }
}

