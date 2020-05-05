import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_dibello/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 4,
      child: ListTile(
        selected: false,
        subtitle: Text("Faça seu pedido!"),
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),
        ),
        title: Text(
          snapshot.data['title'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryScreen(snapshot)));
        },
      ),
    );
  }
}
