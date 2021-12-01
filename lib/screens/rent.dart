
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class RentScreen extends StatefulWidget {
  final PublicationModel pm;

  RentScreen(this.pm);

  @override
  RentScreenState createState() => RentScreenState(pm);
}
class RentScreenState extends State<RentScreen> {

  final PublicationModel pm;

  RentScreenState(this.pm);

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
                    pm.name,
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
                    for (var i = 0; i < pm.images.length; i++)
                      Image.network(
                        pm.images[i],
                        fit: BoxFit.cover,
                      ),
                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  isLoop: false,
                ),
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
                      "Chatear ahora",
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
                    pm.detail,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
