import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   return  CustomScrollView(
     physics: const BouncingScrollPhysics(),
     slivers: <Widget>[
       SliverAppBar(


         snap: false,
         floating: false,
         pinned: true,
         onStretchTrigger: () {
           // Function callback for stretch
           return;
         },
         expandedHeight: 300.0,
         flexibleSpace: FlexibleSpaceBar(
           stretchModes: <StretchMode>[
             StretchMode.zoomBackground,
             StretchMode.blurBackground,
             StretchMode.fadeTitle,

           ],

           centerTitle: true,
           title: const Text('Di Bello Pizzeria'),
           background: Stack(

             fit: StackFit.expand,
             children: [

               Image.asset(
                 'assets/logo-dibello-vertical.png',
                 fit: BoxFit.contain,
               ),
               const DecoratedBox(

                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment(0.0, 0.5),
                     end: Alignment(0.0, 0.0),
                     colors: <Color>[
                       Color(0x60000000),
                       Color(0x00000000),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),

       SliverList(

         delegate: SliverChildListDelegate([
           Divider(thickness: 8,),

           SizedBox(height: 5,),
           Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: ListView(
                padding: EdgeInsets.only(right: 12),
                scrollDirection: Axis.horizontal,

                children: <Widget>[
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(

                        borderRadius: BorderRadius.circular(8),


                        child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/03/3.jpg", height: 120, ),
                      ),
                      SizedBox(height: 10,),

                      Text( "Confira Nossa melhor pizza!", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/03/3.jpg", height: 120),
                      ),
                      SizedBox(height: 10,),
                      Text( "Confira Nossa melhor pizza!", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/03/3.jpg", height: 120),
                      ),
                      SizedBox(height: 10,),
                      Text( "Confira Nossa melhor pizza!", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/03/3.jpg", height: 120),
                      ),
                      SizedBox(height: 10,),
                      Text( "Confira Nossa melhor pizza!", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),

           ),
           ),

           Divider(thickness: 8,),
           Container(



             padding: EdgeInsets.all(12),
             child: ClipRRect(

               borderRadius: BorderRadius.circular(8),
               child: Image.asset("assets/massa-01.jpg",),
             ),

           ),
           SizedBox(height: 1),
           Padding(padding: EdgeInsets.all(5),

             child: Row(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 new Row(

                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     IconButton(


                       icon: Icon(Icons.favorite,  size: 30, ),
                       color: Colors.black38,
                       disabledColor: Colors.red,
                       onPressed: (){

                       },

                     ),
                     SizedBox( width: 10,),


                     new IconButton(icon: Icon(Icons.monetization_on, color: Colors.black, size: 30, ), onPressed: (){

                     }),

                   ],
                 ),

               ],


             ),

           ),
          Padding(padding: EdgeInsets.only(left: 20, bottom: 0),
          child:  Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("234 Pessoas curtiram isso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          ),



           Divider(thickness: 8,),
           Container(
             height: 150,
             padding: EdgeInsets.only(top: 12,left: 12),
             alignment: Alignment.topLeft,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("CATEGORIA",
                   style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,) ,
                 ),
                 SizedBox(height: 2,),
                 Expanded(
                   child: ListView(
                     scrollDirection: Axis.horizontal,
                     children: <Widget>[
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/01/23-600x380.jpg", height: 70,),
                           ),
                           Text("Pizzas", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.network("https://i1.wp.com/www.wine.com.br/winepedia/wp-content/uploads/2017/04/Malbec.jpg?resize=1180%2C517&ssl=1", height: 70,),
                           ),
                           Text("Vinhos", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.asset("assets/massa-01.jpg",height: 70,),

                           ),
                           SizedBox(height: 2,),
                           Text("Massas", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),

                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.asset("assets/petit-gateau.JPG",height: 70,),

                           ),
                           SizedBox(height: 2,),
                           Text("Sobremesa", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),


                     ],
                   ),

                 ),

               ],
             ),


           ),
           Divider(thickness: 8,),



           Container(



             padding: EdgeInsets.all(12),
             child: ClipRRect(

               borderRadius: BorderRadius.circular(8),
               child: Image.asset("assets/art-04.jpg",),
             ),

           ),
           SizedBox(height: 1),

           Padding(padding: EdgeInsets.all(5),

             child: Row(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 new Row(

                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     IconButton(

                       icon: Icon(Icons.favorite,  size: 30,),
                       color: Colors.black38,
                       disabledColor: Colors.red,
                       onPressed: (){

                       },

                     ),
                     SizedBox( width: 10,),


                     new IconButton(icon: Icon(Icons.monetization_on, color: Colors.black, size: 30, ), onPressed: (){

                     }),

                   ],
                 ),

               ],


             ),

           ),
           Padding(padding: EdgeInsets.only(left: 20, bottom: 0),
             child:  Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("234 Pessoas curtiram isso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                   ),
                 ],
               ),
             ),
           ),


           Divider(thickness: 8,),
           Container(
             height: 150,
             padding: EdgeInsets.only(top: 12,left: 12),
             alignment: Alignment.topLeft,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("CATEGORIA",
                   style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,) ,
                 ),
                 SizedBox(height: 2,),
                 Expanded(
                   child: ListView(
                     scrollDirection: Axis.horizontal,
                     children: <Widget>[
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.network("http://dibellopizzeria.site.com.br/wp-content/uploads/sites/293247/2020/01/23-600x380.jpg", height: 70,),
                           ),
                           Text("Pizzas", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.network("https://i1.wp.com/www.wine.com.br/winepedia/wp-content/uploads/2017/04/Malbec.jpg?resize=1180%2C517&ssl=1", height: 70,),
                           ),
                           Text("Vinhos", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.asset("assets/massa-01.jpg",height: 70,),

                           ),
                           SizedBox(height: 2,),
                           Text("Massas", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),

                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           ClipRRect(
                             borderRadius: BorderRadius.circular(4),
                             child: Image.asset("assets/petit-gateau.JPG",height: 70,),

                           ),
                           SizedBox(height: 2,),
                           Text("Sobremesa", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),


                     ],
                   ),

                 ),

               ],
             ),


           ),
           Divider(thickness: 8,),

           Container(



             padding: EdgeInsets.all(12),
             child: ClipRRect(

               borderRadius: BorderRadius.circular(8),
               child: Image.asset("assets/carne-01.jpg",),
             ),

           ),
           SizedBox(height: 1),

           Padding(padding: EdgeInsets.all(5),

             child: Row(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 new Row(

                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     IconButton(

                       icon: Icon(Icons.favorite,  size: 30,),
                       color: Colors.black38,
                       disabledColor: Colors.red,
                       onPressed: (){


                       },

                     ),
                     SizedBox( width: 10,),


                     new IconButton(icon: Icon(Icons.monetization_on, color: Colors.black, size: 30, ), onPressed: (){

                     }),

                   ],
                 ),

               ],


             ),

           ),
           Padding(padding: EdgeInsets.only(left: 20, bottom: 0),
             child:  Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("234 Pessoas curtiram isso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                   ),
                 ],
               ),
             ),
           ),
           Divider(thickness: 8,),




           // ListTiles++
         ]),

       ),

     ],

   );

  }



}

