import 'dart:io';
import 'package:argon_flutter/screens/new-publication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';


class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();
  static TextEditingController _nameField = TextEditingController();
  static TextEditingController _detailField = TextEditingController();
  static List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Transporte', title: 'Transporte'),
    S2Choice<String>(value: 'Consolas', title: 'Consolas'),
    S2Choice<String>(value: 'Juegos', title: 'Juegos'),
    S2Choice<String>(value: 'Inflables', title: 'Inflables'),
    S2Choice<String>(value: 'Disfraces', title: 'Disfraces'),
    S2Choice<String>(value: 'Trajes', title: 'Trajes'),
    S2Choice<String>(value: 'Instrumentos', title: 'Instrumentos'),
  ];
  static String value;

  DialogUtils.internal();
  factory DialogUtils() => _instance;
  static void showCustomDialog(BuildContext context,
      {@required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      @required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextField(
                controller: _nameField,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Nombre'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _detailField,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Descripcion'),
              ),
              Column(
                children: <Widget>[
                const SizedBox(height: 7),
                  SmartSelect<String>.single(
                      placeholder: "seleccionar",
                      title: 'Categorias',
                      value: value,
                      choiceItems: options,
                      onChange: (selected) => value = selected.value
                  )
                ],
              ),
              TextButton(
                child: Text("Siguiente"),
                onPressed: () async {
                  if(value != "" && _nameField.text != "" && _detailField.text != "" ) {
                      Navigator.pop(context);
                  } else {
                    // TOAST DE QUE FALTA ALGUN CAMPO
                  }
                },
              ),
              TextButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}
