import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

import 'card-small.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
              hintText: 'Nombre'
              ),
              ),
              SizedBox(height: 16.0),

              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descripcion'
                ),
              ),

            Selector(),


              FlatButton(
                child: Text(okBtnText),
                onPressed: okBtnFunction,
              ),
              FlatButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}

class Selector  extends StatelessWidget {
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
        onChange: (state) =>(() => value = state.value)
    );
  }

}
