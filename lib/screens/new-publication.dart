import 'dart:io';

import 'package:argon_flutter/backend/models/insurance-model.dart';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_select/smart_select.dart';

class settingsUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "settings UI",
      home: NewPublicationScreen(),
    );
  }
}

class NewPublicationScreen extends StatefulWidget{

  @override
  NewPublicationScreenState createState() => NewPublicationScreenState();
}
class NewPublicationScreenState extends State<NewPublicationScreen> {
  static TextEditingController _nameField = TextEditingController();
  static TextEditingController _detailField = TextEditingController();
  static TextEditingController _priceField = TextEditingController();
  static List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Bicicletas', title: 'Bicicletas'),
    S2Choice<String>(value: 'Consolas', title: 'Consolas'),
    S2Choice<String>(value: 'Disfraces', title: 'Disfraces'),
  ];
  static List<S2Choice<String>> times = [
    S2Choice<String>(value: 'Hora', title: 'Hora'),
    S2Choice<String>(value: 'Dia', title: 'Día'),
    S2Choice<String>(value: 'Mes', title: 'Mes'),
    S2Choice<String>(value: 'Anio', title: 'Año'),
  ];
  InsuranceModel insurance1 = InsuranceModel("Seguro1","50");
  InsuranceModel insurance2 = InsuranceModel("Seguro2", "100");

  static String value;
  static String time;
  static InsuranceModel insuranceValue;
  List<File> _images = [];
  @override
  Widget build(BuildContext context) {
    List<S2Choice<InsuranceModel>> insurances = [
      S2Choice<InsuranceModel>(value: insurance1, title: "${insurance1.name}: \$${insurance1.price}"),
      S2Choice<InsuranceModel>(value: insurance2, title: "${insurance2.name}: \$${insurance2.price}")
    ];
    bool loaded = false;
    return Scaffold(
      appBar: Navbar(
          rightOptions: false,
          favOption: false,
          backButton: true,
          bgColor: MyTheme.primary,
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Título de la publicación",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: TextField(
                    controller: _nameField,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Agregue un título a su producto'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Fotos del producto",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),

                ImageSlideshow(
                  width: double.infinity,
                  height: 250,
                  initialPage: 0,
                  indicatorColor: Colors.grey,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    Image.network(
                      "http://www.carsaludable.com.ar/wp-content/uploads/2014/03/default-placeholder.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  isLoop: false,
                ),

                RawMaterialButton(
                  fillColor: Theme.of(context).accentColor,
                  child: Icon(Icons.add_photo_alternate_rounded,
                    color: Colors.white,),
                  elevation: 8,
                  onPressed: () async {
                    getImage();
                    loaded = true;
                  },
                  padding: EdgeInsets.all(15),
                  shape: CircleBorder(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Precio por tiempo de uso",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _priceField,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Elija un precio'),
                    ),
                  ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 7),
                    SmartSelect<String>.single(
                        placeholder: "Seleccionar",
                        title: 'Tiempo',
                        value: time,
                        modalType: S2ModalType.bottomSheet,
                        choiceItems: times,
                        onChange: (selected) => time = selected.value
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Descripción",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    controller: _detailField,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Escriba aquí una descripción'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Categoria",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 7),
                    SmartSelect<String>.single(
                        placeholder: "Seleccionar",
                        title: 'Categorias',
                        value: value,
                        modalType: S2ModalType.bottomSheet,
                        choiceItems: options,
                        onChange: (selected) => value = selected.value
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Seguro",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 7),
                    SmartSelect<InsuranceModel>.single(
                        placeholder: "Seleccionar",
                        title: 'Seguros',
                        value: insuranceValue,
                        modalType: S2ModalType.bottomSheet,
                        choiceItems: insurances,
                        onChange: (selected) => insuranceValue = selected.value
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      if(value != "" && _nameField.text != "" && _detailField.text != "" && _priceField.text != "" && time != "" && _images.isNotEmpty && insuranceValue != null) {
                        PublicationModel pm = PublicationModel();
                        pm.name = _nameField.text;
                        pm.detail = _detailField.text;
                        pm.category = value;
                        pm.price = _priceField.text;
                        pm.images = null;
                        pm.timeUnit = time;
                        pm.isFavourite = false;
                        pm.id = "73";
                        pm.insuranceName = insuranceValue.name;
                        pm.insurancePrice = insuranceValue.price;
                        DocumentReference docRef = await addPublication(pm);
                        savePublicationImages(_images, docRef);
                        successDialog(context);
                      } else {
                        AlertDialog alert = AlertDialog(
                          title: Text("ERROR"),
                          content: Text("¡Por favor llene todos los campos!"),
                        );
                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      }
                    },
                    color: MyTheme.blue,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Publicar",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final imagePick = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(imagePick != null) {
      _images.add(File(imagePick.path));
    }
  }

  Future<bool> successDialog( BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Text('¡Publicación creada!',style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok',style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

}

