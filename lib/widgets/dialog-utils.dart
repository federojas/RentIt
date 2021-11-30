
import 'dart:io';

import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:image_picker/image_picker.dart';
import 'card-small.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();
  static TextEditingController _nameField = TextEditingController();
  static TextEditingController _detailField = TextEditingController();
  static List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Bicicletas', title: 'Bicicletas'),
    S2Choice<String>(value: 'Consolas', title: 'Consolas'),
    S2Choice<String>(value: 'Disfraces', title: 'Disfraces'),
  ];
  static String value;


  static File image;
  static String fileName;


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
              Column(
                children: <Widget>[
                  const SizedBox(height: 7),
                  ElevatedButton(
                    child: Text('Elegir imagen'),
                    onPressed: () async {
                     final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);
                     image = File(imagePick.path);
                     final fileName = imagePick.name;
                     final destination = 'products_images/$fileName';
                     //uploadFile(destination, image);
                    }
                  )
                ],
              ),
              TextButton(
                child: Text(okBtnText),
                onPressed: () async {
                  if(value != "" && _nameField.text != "" && _detailField.text != "" ) {
                    bool shouldNavigate = true;
                    //await addProduct(_nameField.text, _detailField.text, value);
                    if (shouldNavigate) {
                      Navigator.pop(context);
                    }
                  } else {
                    // TOAST DE QUE FALTA SELECCIONAR
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
