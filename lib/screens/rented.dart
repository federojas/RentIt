
import 'package:argon_flutter/backend/models/order-model.dart';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/models/rent-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/rent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';



class RentedScreen extends StatefulWidget {
  final RentModel rm;

  RentedScreen(this.rm);

  @override
  RentedScreenState createState() => RentedScreenState(rm);
}
class RentedScreenState extends State<RentedScreen> {

  final RentModel rm;

  RentedScreenState(this.rm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: rm.productName,
          bgColor: MyTheme.primary,
          backButton: true,
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlideshow(
                  width: double.infinity,
                  height: 250,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                      Image.network(
                        rm.image,
                        fit: BoxFit.cover,
                      ),
                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  isLoop: false,
                ),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Row(children: [
                      Text(
                        rm.time + " ",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                      ),
                    ],),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Row(children: [
                      Text(
                        rm.timeUnit,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        rm.timeUnit != "Meses" ? "/s" : "/es",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ],),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Seguro: " + rm.insurance,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
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
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Descripción",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    rm.description,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
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
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Contacto",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom:10.0), child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  child: RaisedButton(
                    onPressed: () => {_sendSMS("¡Hola alquilé " + rm.productName + " en RentIt!", ["1145456767"])},
                    color: MyTheme.blue,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Contactar",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendSMS(String message, List<String> recipients) async {
    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
