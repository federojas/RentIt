
import 'dart:ffi';

import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/widgets/card-category.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/card-shopping.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
class Favourites extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Favoritos",
          searchBar:true,
          bgColor: MyTheme.primary,
        ),

      drawer: ArgonDrawer(currentPage: "Favourites"),

      backgroundColor: MyTheme.bgColorScreen, //esto despues vemos si lo sacamos, para mi queda mas claro
      body: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15.0),
        child: SingleChildScrollView(
            child: Column(
            children: [
              CardSquare(
                  title:"Notebook",
                  img: "https://www.nsx.com.ar/archivos/N_omicron_1.png",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');}

                    ),
              CardSquare(
                  title:"Inflable dona",
                  img: "https://d3ugyf2ht6aenh.cloudfront.net/stores/302/233/products/bdab5e2474f4a5fdbb91fceed4558bba-for-the-summer-summer-time1-af58f92bed8b339d5815123715549446-640-0.jpg",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');}

              ),
              CardSquare(
                  title:"Inflable dona",
                  img: "https://d3ugyf2ht6aenh.cloudfront.net/stores/302/233/products/bdab5e2474f4a5fdbb91fceed4558bba-for-the-summer-summer-time1-af58f92bed8b339d5815123715549446-640-0.jpg",
                  tap: () {
                    Navigator.pushNamed(context, '/pro');}

              ),
              //     cta: "Ver oferta",
              //     title:"Notebook",
              //     img: "https://www.nsx.com.ar/archivos/N_omicron_1.png",
              //     tap: () {
              //       Navigator.pushNamed(context, '/pro');
              //     }
              // )
              SizedBox(height: 50.0),

            ],


            ),
        ),
      ) ,
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}