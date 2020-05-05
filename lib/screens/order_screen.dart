import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:loja_dibello/screens/home_screen.dart';
import 'package:loja_dibello/tabs/home_tab.dart';
import 'package:loja_dibello/tabs/orders_tab.dart';
import 'package:loja_dibello/tiles/order_tile.dart';

class OrderScreen extends StatelessWidget {
  final String orderId;

  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado!"),
        centerTitle: true,
      ),
      body: Container(

        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop([HomeTab()]);

              },

            ),
            Text(
              "Pedido Realizado com Sucesso!",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Codigo do Pedido: $orderId",
              style: TextStyle(fontSize: 16.0),
            ),

          ],
        ),
      ),
    );
  }

}

