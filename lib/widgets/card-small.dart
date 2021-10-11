import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = "https://via.placeholder.com/200",
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      height: 180,
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
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.all(Radius.circular(16.0)),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            )
                        )
                    )
                ),
                Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ArgonColors.header, fontSize: 13)),

                        ],
                      ),
                    ))
              ],
            )),
      ),
    ));
  }
}
