
import 'package:argon_flutter/backend/models/order-model.dart';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/models/rent-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';

class RentScreen extends StatefulWidget {
  final PublicationModel pm;

  RentScreen(this.pm);

  @override
  RentScreenState createState() => RentScreenState(pm);
}
class RentScreenState extends State<RentScreen> {
  String dropdownvalue = 'Aseguradora A';
  var items =  ['Aseguradora A','Aseguradora B','Aseguradora C','A convenir'];
  TextEditingController quantity = TextEditingController(text: "1");
  final PublicationModel pm;
  String payed;
  RentScreenState(this.pm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          rightOptions: false,
          favOption: false,
          backButton: true,
          bgColor: MyTheme.primary
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
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "¡Completá los siguientes pasos para alquilar "+ pm.name+"!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8.0),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10.0),
                //   child: Text(
                //     "Primer paso:",
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                //   ),
                // ),
                // Text("    Elegí como asegurarte:"),
                // Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       DropdownButton(
                //         value: dropdownvalue,
                //         icon: Icon(Icons.keyboard_arrow_down),
                //         items:items.map((String items) {
                //           return DropdownMenuItem(
                //               value: items,
                //               child: Text(items)
                //           );
                //         }
                //         ).toList(),
                //         onChanged: (String newValue){
                //           setState(() {
                //             dropdownvalue = newValue;
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                // ),Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //       thickness: 1.0,
                //       color: Colors.grey
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Primer paso:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:  Text("    Elegí por cuanto tiempo alquilar:"),
                ),


                Row( children:[
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  controller: quantity,
                  validator: (value) {
                    if (int.parse(value) > 50) {
                      return ("Ingrese una cantidad menor a 51.");
                    }
                    // reg expression for email validation
                    if (int.parse(value) < 1) {
                      return ("Ingrese una cantidad mayor a 0.");
                    }
                    return null;
                  },
                      onFieldSubmitted: (value) {
                        quantity.text = quantity.text == "" ? "1" : value;
                      },

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3.0, left: 5.0),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                      hintText: "Ingrese cantidad...",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,)),),),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      pm.timeUnit == "Mes" ? pm.timeUnit+"/es" : pm.timeUnit+"/s",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Segundo paso:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:  Text("    Pagá con MercadoPago:"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Producto: \$"+(int.parse(pm.price)*int.parse(quantity.text)).toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Seguro: \$"+(int.parse(pm.insurancePrice)).toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Total: \$"+( (int.parse(pm.price)*int.parse(quantity.text)) + int.parse(pm.insurancePrice)).toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      OrderModel orderModel = OrderModel();
                      orderModel.productName = pm.name;
                      orderModel.price = (int.parse(pm.price)*int.parse(quantity.text)).toString();
                      orderModel.description = pm.detail;
                      orderModel.publicationId = pm.id;
                      orderModel.image = pm.images[0];
                      orderModel.insurancePrice = pm.insurancePrice;
                      orderModel.insuranceName = pm.insuranceName;
                      PaymentResult paymentResult = await addOrder(orderModel);
                      // https://www.mercadopago.com.ar/developers/es/guides/online-payments/checkout-api/handling-responses
                      // en ese link hay mas casos por si quieren contemplar
                      if(paymentResult.status == "approved") {
                        print("Se aprobo el pago");
                        RentModel rentModel = RentModel();
                        rentModel.price = (int.parse(pm.price)*int.parse(quantity.text)).toString();
                        rentModel.productName = pm.name;
                        rentModel.image = pm.images[0];
                        rentModel.description = pm.detail;
                        rentModel.time = quantity.text;
                        rentModel.timeUnit = pm.timeUnit;
                        rentModel.insurance = pm.insuranceName;
                        addRent(rentModel);
                        successDialog(context);
                      } else if (paymentResult.status == "pending"){
                        print("Pago pending");
                        CircularProgressIndicator();
                      } else if(paymentResult.status == "rejected"){
                        print("No se aprobo el pago");
                        AlertDialog alert = AlertDialog(
                          backgroundColor: Colors.red,
                          title: Text("ERROR"),
                          content: Text("¡El pago no fue aprobado!"),
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
                      "¡Alquilá ya!",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                      thickness: 1.0,
                      color: Colors.grey
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Tercer paso:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:  Text("    Contactate con el vendedor:"),
                ),
              //  Text("    Contactá al vendedor:"),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    color: MyTheme.blue,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Contacto",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
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

  Future<bool> successDialog( BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Text('¡Disfrute su compra!',style: TextStyle(color: Colors.white)),
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


