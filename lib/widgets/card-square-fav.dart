import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CardSquareFav extends StatefulWidget {
  CardSquareFav({this.title = "Placeholder Title",
    this.img = "https://via.placeholder.com/200",
    this.fav = false,
    this.tap = defaultFunc,
    this.cta = ""});

  final String img;
  final String title;
  final bool fav;
  final Function tap;
  final String cta;

  static void defaultFunc() {
    print("the function works!");
  }

  @override // Level_Indicator
  CardSquareFavState createState() => CardSquareFavState(title, img, fav, cta, tap);
}

class CardSquareFavState extends State<CardSquareFav> {
  String title;
  String img;
  bool fav;
  Function tap;
  String cta;

  CardSquareFavState(this.title, this.img, this.fav, this.cta, this.tap);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: null,
        child: GestureDetector(
          onTap: tap,
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
                                image: NetworkImage(img),
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
                            Text(title,
                                style: TextStyle(
                                    color: MyTheme.header, fontSize: 13)),
                            Text(cta,
                                style: TextStyle(
                                    color: MyTheme.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                            IconButton(
                                icon: fav
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    // Here we changing the icon.
                                    fav = !fav;
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