import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/input.dart';

import 'package:argon_flutter/widgets/drawer.dart';

import 'package:argon_flutter/constants/Theme.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _userField = TextEditingController();
  TextEditingController _passwordField2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(
            color: MyTheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _userField,
                decoration: InputDecoration(
                    hintText: "ejemplo",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Usuario",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              TextFormField(
                controller: _emailField,
                decoration: InputDecoration(
                    hintText: "ejemplo@email.com",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "contraseña",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Contraseña",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              TextFormField(
                controller: _passwordField2,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "repetir contraseña",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Repetir contraseña",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: MyTheme.black, width: 1.1)))),
                  onPressed: () => null),
            ],
          )),
    );
  }
}
