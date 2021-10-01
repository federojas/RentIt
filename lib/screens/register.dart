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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    )),
              ),
              TextFormField(
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "repetir contraseña",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Repetir contraseña",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          )),
    );
  }
}
