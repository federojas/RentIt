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
      Container(
          decoration: new BoxDecoration(color: ArgonColors.primary)),
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
                      child: Text("Rentit es la opción más segura para alquilar lo que quieras y obtener ingresos. ¡Empieza ya!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
                Container(
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: ArgonColors.white, width: 2),
                  // ),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: ArgonColors.white,
                      color: ArgonColors.primary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("Iniciar Sesión",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: ArgonColors.black,
                      color: ArgonColors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("Registrarse",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0))),
                    ),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blue, width: 4),
                //     color: Colors.yellow,
                //     shape: BoxShape.circle,
                //   ),
                //   child: IconButton(
                //     iconSize: 56,
                //     icon: Icon(Icons.check),
                //     onPressed: () {},
                //   ),
                // ),
                // Material(
                //   type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                //   child: Ink(
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.indigoAccent, width: 4.0),
                //       color: Colors.indigo[900],
                //       shape: BoxShape.circle,
                //     ),
                //     child: InkWell(
                //       //This keeps the splash effect within the circle
                //       borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                //       onTap: _messages,
                //       child: Padding(
                //         padding:EdgeInsets.all(20.0),
                //         child: Icon(
                //           Icons.message,
                //           size: 30.0,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   )
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   image:DecorationImage(
                //     fit:BoxFit.fill
                //     image: AssetImage("assets/img/welcomepig.png"),
                //   )
                // ),
                Container(
                  child:Center(
                    child:Image.asset("assets/img/welcomepig.png", height: 200, width: 200),
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