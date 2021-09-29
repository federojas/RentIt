import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      /*Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/onboard-background.png"),
                  fit: BoxFit.cover))),*/
      Container(
          decoration: new BoxDecoration(color: Color.fromRGBO(235,115,76,1))),
          // Color.fromRGBO(225,129,106,1)
          // Color.fromRGBO(235,115,76,1)
      Padding(
        padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
        child: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/img/rentItLogo.PNG", scale: 0.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0),
                      child: Text.rich(TextSpan(
                        text: "Rent It",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 58,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text("Rentit es la opción más segura para alquilar lo que quieras y obtener ingresos. ¡Empieza ya!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: ArgonColors.text,
                      color: ArgonColors.secondary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("GET STARTED",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
