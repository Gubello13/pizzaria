import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_dibello/models/user_model.dart';
import 'package:loja_dibello/screens/login_screen.dart';
import 'package:loja_dibello/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);


  @override
  Widget build(BuildContext context) {


    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[

                Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );



    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 20.0,top: 10.0),
            children: <Widget>[
              Container(
                
                padding: EdgeInsets.all(0),
                height: 170.0,
                child: Stack(


                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      left: 35.0,
                      child: Image.asset(
                        'assets/logo-dibello-vertical.png',
                        fit: BoxFit.fill,
                        height: 100,

                      ),


                    ),


                    Positioned(
                      left: 0.0,
                      bottom: 0.0,

                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model){

                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Text("Olá ${!model.isLoggedIn() ? "" : model.userData["name"]  }",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,

                                ),
                              ),
                              SizedBox(height: 1,),
                              Text("Endereço: ""${!model.isLoggedIn() ? "" : model.userData["address"] }"),
                              SizedBox(height: 1,),
                              Text("Telefone:  ""${!model.isLoggedIn() ? "" : model.userData["telefon"] }"),
                              SizedBox(height: 1,),

                              GestureDetector(

                                child: Text(

                                  !model.isLoggedIn() ?
                                  "Entre ou Cadastre-se >"
                                  : "Sair",
                                  style: TextStyle(

                                      color: Colors.red,
                                      fontWeight: FontWeight.normal,

                                      fontSize: 20.0,

                                  ),
                                ),

                                onTap: (){
                                  if(!model.isLoggedIn())
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=> LoginScreen())
                                  );
                                  else
                                    model.signOut();
                                },
                              ),
                            ],
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Divider(),
              SizedBox(height: 20,),
              DrawerTile(Icons.home, "Inicio",pageController,0, ),

              Divider(thickness: 2,),
              DrawerTile(Icons.restaurant, "Cardapio",pageController,1),
              Divider(thickness: 2,),
              DrawerTile(Icons.location_on, "Lojas",pageController,2),
              Divider(thickness: 2,),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos",pageController,3),
              Divider(thickness: 2,),


            ],

          ),
        ],
      ),
    );
  }
}
