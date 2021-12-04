import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/widgets/card-square-fav.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:argon_flutter/widgets/tabbar_material_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';

import 'listing.dart';
class MyListings extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: "Mis publicaciones",
          rightOptions: false,
          bgColor: MyTheme.primary,
          backButton: true
      ),
      //appBar: Navbar(searchBar: true, bgColor: MyTheme.primary,backButton:true),
      drawer: ArgonDrawer(currentPage: "MyListings"),
      backgroundColor: MyTheme.bgColorScreen,
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null && snapshot.data.length != 0) {
            return Container(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                child: ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (context, index) {
                    PublicationModel pm = snapshot.data[index];
                    return CardSquareFav(pm);
                  },
                )
            );
          } else if( snapshot.connectionState == ConnectionState.waiting){
            return Align(
              alignment: Alignment.center,
              child: Container(
                  child: CircularProgressIndicator()
              ),
            );
          } else {
            return Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  "No tiene publicaciones",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),);
          }
        },
        future: getUserPublications(),
      ),


    );
  }
}