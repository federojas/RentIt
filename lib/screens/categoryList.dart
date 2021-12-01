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
            ListTile(
                // leading: PublicationModel(),
                )
          ],
        ));
  }
}
