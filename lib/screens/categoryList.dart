import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/backend/net/flutterfire.dart';

class CategoryList extends StatefulWidget {
  final String category;

  CategoryList({Key key, @required this.category}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState(category);
}

class _CategoryListState extends State<CategoryList> {
  final String category;

  _CategoryListState(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(searchBar: true, bgColor: MyTheme.primary),
      backgroundColor: MyTheme.bgColorScreen,
      body: getListView(),
    );
  }

  Widget getListView() {
    PublicationModel pm = PublicationModel();
    pm.name = "name";
    pm.uid = "uid";
    pm.detail = "detail";
    pm.category = "category";
    pm.price = "price";
    pm.images = null;
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        } else {
          return Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
              child: ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  PublicationModel pm = snapshot.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(pm.images[0]),
                        radius: 25.0),
                    title: Text(pm.name),
                    subtitle: Text(pm.price),
                    trailing: Icon(Icons.favorite_border),
                  );
                },
              )
          );
        }
      },
      future: getPublicationsByCategory(category),
    );

    /*
    return Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: ListView(
          children: [
            Text(
              category,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            FutureBuilder(
                future: getPublicationsByCategory(category),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    PublicationModel pm = snapshot.data[0];
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(pm.images[0]),
                          radius: 25.0),
                      title: Text(pm.name),
                      subtitle: Text(pm.price),
                      trailing: Icon(Icons.favorite_border),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ));

     */
  }
}
