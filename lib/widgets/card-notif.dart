import 'package:argon_flutter/backend/models/rent-model.dart';
import 'package:argon_flutter/screens/rented.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CardNotif extends StatelessWidget {

  CardNotif(this.rentModel);
  final RentModel rentModel;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: null,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RentedScreen(this.rentModel)));
          },
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
                                image: NetworkImage(rentModel.image),
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
                            Text(rentModel.productName,
                                style: TextStyle(
                                    color: MyTheme.header, fontSize: 20)
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        )
    );
  }
}
