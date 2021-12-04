
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
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:flutter_sms/flutter_sms.dart';

class ListingScreen extends StatefulWidget {
  final PublicationModel pm;

  ListingScreen(this.pm);

  @override
  ListingPageState createState() => ListingPageState(pm);
}
class ListingPageState extends State<ListingScreen> {

  final PublicationModel pm;

  ListingPageState(this.pm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          title: pm.name,
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
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                pm.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            ImageSlideshow(
              width: double.infinity,
              height: 250,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                for (var i = 0; i < pm.images.length; i++)
                  Image.network(
                    pm.images[i],
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
                    "\$",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    pm.price,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                ],),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Row(children: [
                  Text(
                    "\\",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    pm.timeUnit,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                      icon: pm.isFavourite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          pm.isFavourite ? removeFavourite(pm) : addFavourite(pm);
                          pm.isFavourite = !pm.isFavourite;
                        });
                      }),
                ],),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "+ ${pm.insurancePrice}% del seguro ${pm.insuranceName}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
               ),
            ),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 50.0,
                child: RaisedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RentScreen(pm),
                        ));
                    // OrderModel orderModel = OrderModel();
                    // orderModel.productName = pm.name;
                    // orderModel.price = pm.price;
                    // orderModel.description = pm.detail;
                    // orderModel.publicationId = pm.id;
                    // orderModel.image = pm.images[0];
                    // PaymentResult paymentResult = await addOrder(orderModel);
                    // // https://www.mercadopago.com.ar/developers/es/guides/online-payments/checkout-api/handling-responses
                    // // en ese link hay mas casos por si quieren contemplar
                    // if(paymentResult.status == "approved") {
                    //   print("se aprobo el pago");
                    //   RentModel rentModel = RentModel();
                    //   rentModel.price = pm.price;
                    //   rentModel.productName = pm.name;
                    //   rentModel.image = pm.images[0];
                    //   rentModel.description = pm.detail;
                    //   addRent(rentModel);
                    // } else if (paymentResult.status == "pending"){
                    //   // mostrar algo de cargando
                    //   print("cargando");
                    // } else {
                    //   print("no se aprobo el pago");
                    // }
                  },
                  color: MyTheme.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Alquilar ahora",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
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
                pm.detail,
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
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width - 50.0,
              child: RaisedButton(
              onPressed: () => {_sendSMS("¡Hola me interesa tu publicación " + pm.name + " en RentIt!", ["1155556666"])},
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
            ),),
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
