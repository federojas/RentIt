import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card-small.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

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
            // ACA VA EL WIDGET DEL DIALOGO
            content: CardSmall(
              cta: "View article",
              title: "Artículos playa",
              img: "https://d3ugyf2ht6aenh.cloudfront.net/stores/051/422/products/reposera-milona-ambas11-21eea12ee05e8ebfbf15793578714056-1024-1024.jpeg",
            ),
            actions: <Widget>[
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