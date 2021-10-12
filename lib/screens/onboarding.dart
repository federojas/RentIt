import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/ink.dart';
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
      Container(decoration: new BoxDecoration(color: MyTheme.primary)),
      Padding(
        padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
        child: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0),
                      child: Text.rich(TextSpan(
                        text: "Rentit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 58,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                          "Rentit es la opción más segura para alquilar lo que quieras y obtener ingresos. ¡Empieza ya!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
                TextButton(
                    child: SizedBox(
                        width: double.infinity,
                        child: Text("Ingresar",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(ArgonColors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: ArgonColors.white, width: 1.5)
                            )
                        )
                    ),
                   // onPressed: () => null
                    onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                    },
                ),
                TextButton(
                    child: SizedBox(
                        width: double.infinity,
                        child: Text("Registrarse",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(MyTheme.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(MyTheme.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: MyTheme.black, width: 1.1)
                        ))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    }),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   image:DecorationImage(
                //     fit:BoxFit.fill
                //     image: AssetImage("assets/img/welcomepig.png"),
                //   )
                // ),
                Container(
                  child: Center(
                    child: Image.asset("assets/img/welcomepig.png",
                        height: 200, width: 200),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}

/*
lib/screens/onboarding.dart:108:30: Error: The getter '_messages' isn't defined for the class 'Onboarding'.
 - 'Onboarding' is from 'package:argon_flutter/screens/onboarding.dart' ('lib/screens/onboarding.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named '_messages'.
                      onTap: _messages,
                      */