import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/widgets/dialog-utils.dart';
import 'package:argon_flutter/widgets/tabbar_material_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/card-notif.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';

import 'listing.dart';
// import 'package:argon_flutter/widgets/drawer.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Alquileres de notebooks",
    "image": "https://www.nsx.com.ar/archivos/N_omicron_1.png"
  },
  "Makeup": {
    "title": "Notebooks",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80"
  },
  "Coffee": {
    "title": "Bicicletas",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80"
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80"
  }
};

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
          searchBar: true,
          //bgColor: Color.fromRGBO(225,129,106,1)
          bgColor: MyTheme.primary),
//      backgroundColor: Color.fromRGBO(234, 236, 238,1), //esto despues vemos si lo sacamos, para mi queda mas claro
      backgroundColor: MyTheme.bgColorScreen,

      body: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom:5.0),
                child: Text(
                  '¡Descubrí RentIt!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null && snapshot.data.length != 0) {
                    List<Widget> pubList = new List<Widget>();
                    for(var i = 0; i < snapshot.data.length; i++) {
                      PublicationModel pm = snapshot.data[i];
                      pubList.add(
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: CardSquare(
                              cta: "",
                              title: pm.name,
                              img: pm.images[0],
                              tap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ListingScreen(pm)));},
                            ),
                          ),
                      );
                    }
                    return Container(
                        child: CarouselSlider(
                          items: pubList,
                          options: CarouselOptions(
                            autoPlay: true,
                          ),
                        ),
                    );
                  } else if( snapshot.connectionState == ConnectionState.waiting){
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: CircularProgressIndicator()
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "No hay favoritos",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),);
                  }
                },
                future: getAllPublications(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Categorías',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardSmall(
                    cta: "View article",
                    title: "Consolas",
                    img: "https://i.blogs.es/86b11e/ps51/1366_2000.jpeg",
                  ),
                ],
              ),
              SizedBox(height: 9.0),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardSmall(
                    cta: "View article",
                    title: "Consolas",
                    img: "https://i.blogs.es/86b11e/ps51/1366_2000.jpeg",
                  ),
                  SizedBox(width: 16.0),
                  CardSmall(
                    cta: "View article",
                    title: "Bicicletas",
                    img:
                        "https://labicikleta.com/wp-content/uploads/2016/07/FeatureBiciMontana-770x513.jpg",
                  )
                ],
              ),
              SizedBox(height: 8.0),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardSmall(
                    cta: "View article",
                    title: "Juegos",
                    img:
                        "http://d2r9epyceweg5n.cloudfront.net/stores/001/239/905/products/ene-3-plastico1-ca76755057a823aeea16165340604100-640-0.jpg",
                  ),
                  SizedBox(width: 16.0),
                  CardSmall(
                    cta: "View article",
                    title: "Artículos playa",
                    img:
                        "https://d3ugyf2ht6aenh.cloudfront.net/stores/051/422/products/reposera-milona-ambas11-21eea12ee05e8ebfbf15793578714056-1024-1024.jpeg",
                  )
                ],
              ),
              SizedBox(height: 124.0),
            ],
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     DialogUtils.showCustomDialog(context,
      //         title: "Gallary",
      //         okBtnText: "Save",
      //         cancelBtnText: "Cancel",
      //     );
      //   },
      //   backgroundColor: MyTheme.primary,
      //   child: Container(
      //     margin: EdgeInsets.all(15.0),
      //     child: Icon(Icons.add, size: 25),
      //   ),
      //   elevation: 4.0,
      // ),
      //boton nav bar
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     margin: EdgeInsets.only(left: 12.0, right: 12.0),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         IconButton(
      //           iconSize: 27.0,
      //           icon: Icon(
      //             Icons.home,
      //             color: Colors.black,
      //           ),
      //         ),
      //         IconButton(
      //           iconSize: 27.0,
      //           icon: Icon(
      //             Icons.favorite_border,
      //           ),
      //         ),
      //         //to leave space in between the bottom app bar items and below the FAB
      //         SizedBox(
      //           width: 50.0,
      //         ),
      //         IconButton(
      //           iconSize: 27.0,
      //           icon: Icon(
      //             Icons.chat_bubble_outline,
      //           ),
      //         ),
      //         IconButton(
      //           iconSize: 27.0,
      //
      //           icon: Icon(
      //             Icons.account_circle_rounded,
      //
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   //to add a space between the FAB and BottomAppBar
      //   shape: CircularNotchedRectangle(),
      //   //color of the BottomAppBar
      //   color: Colors.white,
      // ),
    );
  }
}
