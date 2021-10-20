import 'package:argon_flutter/widgets/register-input.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/widgets/input.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.secondary,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 1.2,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyTheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Center(
                  child: Image.asset("assets/img/rentItLogo.png",
                      height: 200, width: 200),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right:16.0),
                  child: RegisterInput(
                    placeholder: "Usuario",
                    controller: _userField,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right:16.0),
                  child: RegisterInput(
                    placeholder: "Email",
                    controller: _emailField,
                  ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right:16.0),
                  child: RegisterInput(
                    placeholder: "Contraseña",
                    controller: _passwordField,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right:16.0),
                  child: RegisterInput(
                    placeholder: "Repetir contraseña",
                    controller: _passwordField2,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right:16.0),
                  child:TextButton(
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
                      onPressed: () => null
                      /* onPressed: ()
                          bool shouldNavigate = await register(_emailField.text, _passwordField.text)
                          if(shouldNavigate) {
                            aca podria mandarme a otra screen
                          }
                      */
                  ),
                )
            ]
        ),
      )

      /*Container(
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
          )
       ),*/
      ),
    );
  }
}
