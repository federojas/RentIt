
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';



class settingsUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "settings UI",
      home: ListingScreen(),
    );
  }
}

class ListingScreen extends StatefulWidget{

  @override
  ListingPageState createState() => ListingPageState();
}
class ListingPageState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          rightOptions: true,
          favOption: true,
          backButton: true,
          bgColor: MyTheme.primary
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Inflable con Escalera Cumpleaños Zona Sur",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            ImageSlideshow(
              width: double.infinity,
              height: 250,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.network(
                  "https://i.blogs.es/86b11e/ps51/1366_2000.jpeg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "http://d2r9epyceweg5n.cloudfront.net/stores/001/239/905/products/ene-3-plastico1-ca76755057a823aeea16165340604100-640-0.jpg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://d3ugyf2ht6aenh.cloudfront.net/stores/051/422/products/reposera-milona-ambas11-21eea12ee05e8ebfbf15793578714056-1024-1024.jpeg",
                  fit: BoxFit.cover,
                ),
              ],
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              isLoop: false,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  "\$4.999",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  "\\mes",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
            ]),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: MyTheme.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Alquilar ahora",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
                ),
        ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(
                    thickness: 1.0,
                    color: Colors.grey
                ),
          ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "Descripción",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Inflable impecable, instalación incluida.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Divider(
                  thickness: 1.0,
                  color: Colors.grey
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Preguntas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0),
            child: TextField(
              controller: null,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3.0, left: 5.0),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  hintText: "Escribí tu pregunta...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  )),
            ),),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width - 50.0,
              child: RaisedButton(
              onPressed: () {},
              color: MyTheme.blue,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Preguntar",
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white),
              ),
            ),),
          ],
          ),
        ),
        ),
      ),
    );
  }
}
