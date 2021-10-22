import 'package:flutter/material.dart';

import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
// import 'package:argon_flutter/widgets/drawer.dart';
import 'package:argon_flutter/widgets/input.dart';
import 'package:argon_flutter/widgets/table-cell.dart';

class Elements extends StatefulWidget {
  @override
  _ElementsState createState() => _ElementsState();
}

class _ElementsState extends State<Elements> {
  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Elements",
        ),
        backgroundColor: MyTheme.bgColorScreen,
        // drawer: ArgonDrawer(currentPage: "Elements"),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
          child: SafeArea(
            bottom: true,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Buttons",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.initial,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("DEFAULT",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.text,
                    color: MyTheme.secondary,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("SECONDARY",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.primary,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("PRIMARY",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.info,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("INFO",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.success,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("SUCCESS",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.warning,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("WARNING",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: MyTheme.white,
                    color: MyTheme.error,
                    onPressed: () {
                      // Respond to button press
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("ERROR",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Typography",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Heading 1",
                      style: TextStyle(fontSize: 44, color: MyTheme.text)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Heading 2",
                    style: TextStyle(fontSize: 38, color: MyTheme.text)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Heading 3",
                    style: TextStyle(fontSize: 30, color: MyTheme.text)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Heading 4",
                    style: TextStyle(fontSize: 24, color: MyTheme.text)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Heading 5",
                    style: TextStyle(fontSize: 21, color: MyTheme.text)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Paragraph",
                    style: TextStyle(fontSize: 16, color: MyTheme.text)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("This is a muted paragraph.",
                    style: TextStyle(fontSize: 16, color: MyTheme.muted)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Inputs",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Input(
                  placeholder: "Regular",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Input(
                  placeholder: "Custom border",
                  borderColor: MyTheme.info,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Input(
                  placeholder: "Icon left",
                  prefixIcon: Icon(Icons.ac_unit),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Input(
                  placeholder: "Icon right",
                  suffixIcon: Icon(Icons.ac_unit),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Input(
                  placeholder: "Custom success",
                  borderColor: MyTheme.success,
                  suffixIcon: Icon(Icons.check_circle, color: MyTheme.success),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Input(
                  placeholder: "Custom error",
                  borderColor: MyTheme.error,
                  suffixIcon: Icon(Icons.error, color: MyTheme.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32, bottom: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Switches",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Switch is ON", style: TextStyle(color: MyTheme.text)),
                  Switch.adaptive(
                    value: switchValueOne,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueOne = newValue),
                    activeColor: MyTheme.primary,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Switch is OFF", style: TextStyle(color: MyTheme.text)),
                  Switch.adaptive(
                    value: switchValueTwo,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueTwo = newValue),
                    activeColor: MyTheme.primary,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32, bottom: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Navigation",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              Navbar(
                title: "Regular",
                backButton: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Navbar(
                    title: "Custom background",
                    backButton: true,
                    bgColor: MyTheme.primary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Navbar(
                  title: "Categories",
                  searchBar: true,
                  categoryOne: "Incredible",
                  categoryTwo: "Customization",
                  backButton: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Navbar(
                  title: "Search",
                  searchBar: true,
                  backButton: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32, bottom: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Table Cell",
                      style: TextStyle(
                          color: MyTheme.text,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),
              TableCellSettings(
                  title: "Manage Options in Settings",
                  onTap: () {
                    Navigator.pushNamed(context, '/pro');
                  }),
            ]),
          ),
        )));
  }
}
