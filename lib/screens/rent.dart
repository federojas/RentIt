
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

  final PublicationModel pm;

  RentScreenState(this.pm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          rightOptions: true,
          favOption: true,
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
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "¡Completá los siguientes pasos para alquilar tu "+ pm.name+"!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    "Primer paso:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Text("    Elegí como asegurarte:"),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items:items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(items)
                          );
                        }
                        ).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
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
                Text("    Pagá con MercadoPago:"),

                // Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //       thickness: 1.0,
                //       color: Colors.grey
                //   ),
                // ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      OrderModel orderModel = OrderModel();
                      orderModel.productName = pm.name;
                      orderModel.price = pm.price;
                      orderModel.description = pm.detail;
                      orderModel.publicationId = pm.id;
                      orderModel.image = pm.images[0];
                      PaymentResult paymentResult = await addOrder(orderModel);
                      // https://www.mercadopago.com.ar/developers/es/guides/online-payments/checkout-api/handling-responses
                      // en ese link hay mas casos por si quieren contemplar
                      if(paymentResult.status == "approved") {
                        print("se aprobo el pago");
                        RentModel rentModel = RentModel();
                        rentModel.price = pm.price;
                        rentModel.productName = pm.name;
                        rentModel.image = pm.images[0];
                        rentModel.description = pm.detail;
                        addRent(rentModel);
                      } else if (paymentResult.status == "pending"){
                        // mostrar algo de cargando
                        print("cargando");
                      } else {
                        print("no se aprobo el pago");
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
              //  Text("    Contactá al vendedor:"),
                ButtonTheme(
                  //minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    color: MyTheme.blue,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Contactá al vendedor",
                      style: TextStyle(
                          fontSize: 10,
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
}


