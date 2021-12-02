import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/screens/favourites.dart';
import 'package:argon_flutter/screens/listing.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CardSquareListing extends StatefulWidget {
  CardSquareListing(this.publicationModel);
  final PublicationModel publicationModel;

  static void defaultFunc() {
    print("the function works!");
  }

  @override // Level_Indicator
  CardSquareListingState createState() => CardSquareListingState(this.publicationModel);
}

class CardSquareListingState extends State<CardSquareListing> {
  final PublicationModel publicationModel;

  CardSquareListingState(this.publicationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: null,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => ListingScreen(publicationModel)));
          },
          child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 8,
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
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 1.0, left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(publicationModel.name,
                                style: TextStyle(
                                    color: MyTheme.header, fontSize: 20)),
                            IconButton(
                                icon: publicationModel.isFavourite
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    publicationModel.isFavourite
                                        ? removeFavourite(publicationModel)
                                        : addFavourite(publicationModel);
                                    publicationModel.isFavourite =
                                    !publicationModel.isFavourite;
                                  });
                                }),
                          ],
                        ),
                      ),),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Row(children: [
                      Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        publicationModel.price,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "\\",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        publicationModel.timeUnit,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ],),),
                ],
              )),
        )); }
  }