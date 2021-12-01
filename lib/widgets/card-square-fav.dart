import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/screens/favourites.dart';
import 'package:argon_flutter/screens/listing.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CardSquareFav extends StatefulWidget {
  CardSquareFav(this.publicationModel);
  final PublicationModel publicationModel;

  static void defaultFunc() {
    print("the function works!");
  }

  @override // Level_Indicator
  CardSquareFavState createState() => CardSquareFavState(this.publicationModel);
}

class CardSquareFavState extends State<CardSquareFav> {
  final PublicationModel publicationModel;

  CardSquareFavState(this.publicationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: null,
        child: GestureDetector(
          onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ListingScreen()));},
          child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6.0),
                                  topRight: Radius.circular(6.0)),
                              image: DecorationImage(
                                image: NetworkImage(publicationModel.images[0]),
                                fit: BoxFit.cover,
                              )))),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 1.0, left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(publicationModel.name,
                                style: TextStyle(
                                    color: MyTheme.header, fontSize: 13)),
                            /* Este no se para que estaba
                            Text(publicationModel.name,
                                style: TextStyle(
                                    color: MyTheme.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),

                             */
                            IconButton(
                                icon: publicationModel.isFavourite
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    publicationModel.isFavourite ? removeFavourite(publicationModel) : addFavourite(publicationModel);
                                  });
                                }),
                          ],
                        ),
                      ))
                ],
              )),
        ));
  }
}