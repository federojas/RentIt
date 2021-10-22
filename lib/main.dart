import 'package:argon_flutter/constants/Theme.dart';
import 'package:argon_flutter/screens/chats.dart';
import 'package:argon_flutter/screens/favourites.dart';
import 'package:argon_flutter/widgets/dialog-utils.dart';
import 'package:argon_flutter/widgets/tabbar_material_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// screens
import 'package:argon_flutter/screens/onboarding.dart';
import 'package:argon_flutter/screens/pro.dart';
import 'package:argon_flutter/screens/home.dart';
import 'package:argon_flutter/screens/profile.dart';
import 'package:argon_flutter/screens/register.dart';
import 'package:argon_flutter/screens/articles.dart';
import 'package:argon_flutter/screens/elements.dart';
import 'package:argon_flutter/screens/productview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Argon PRO Flutter',
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        initialRoute: "/onboarding",
        home: MainPage(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
          "/profile": (BuildContext context) => new Profile(),
          "/articles": (BuildContext context) => new Articles(),
          "/elements": (BuildContext context) => new Elements(),
          "/account": (BuildContext context) => new Register(),
          "/pro": (BuildContext context) => new Pro(),
          "/register": (BuildContext context) => new Register(),
          "/main" :(BuildContext context)=> new MainPage(),
          "/favourites" :(BuildContext context)=> new Favourites(),
          "/product":(BuildContext context)=> new ProductView(),
        });
  }

}
class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = <Widget>[
    Home(),
    Favourites(),
    Chats(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            DialogUtils.showCustomDialog(context, title: "Galeria",
              okBtnText: "guardar",
            cancelBtnText: "cancelar");
          },
          backgroundColor: MyTheme.primary,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}