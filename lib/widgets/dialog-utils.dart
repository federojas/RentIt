import 'package:argon_flutter/net/flutterfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

import 'card-small.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();
  static TextEditingController _nameField = TextEditingController();
  static TextEditingController _detailField = TextEditingController();
  static TextEditingController _categoryField = TextEditingController();
  DialogUtils.internal();

  factory DialogUtils() => _instance;
  String value = 'flutter';

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
            // ACA VA EL WIDGET DEL DIALOGO
            // content: CardSmall(
            //   cta: "View article",
            //   title: "Artículos playa",
            //   img: "https://d3ugyf2ht6aenh.cloudfront.net/stores/051/422/products/reposera-milona-ambas11-21eea12ee05e8ebfbf15793578714056-1024-1024.jpeg",
            // ),
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
              Selector(),
              TextButton(
                  child: Text(okBtnText),
                  onPressed: () async {
                    bool shouldNavigate =
                    await addProduct(_nameField.text, _detailField.text, "Bicicletas");
                    if (shouldNavigate) {
                      Navigator.pop(context);
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

class Selector extends StatelessWidget {
  String value = 'Bicicletas';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Bicicletas'),
    S2Choice<String>(value: 'flu', title: 'Consolas'),
    S2Choice<String>(value: 'rea', title: 'Disfraces'),
  ];

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
        placeholder: "seleccionar",
        title: 'Categorias',
        value: value,
        choiceItems: options,
        onChange: (state) => (() => value = state.value));
  }
}
