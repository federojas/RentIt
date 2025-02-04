import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:argon_flutter/constants/Theme.dart';

import 'package:argon_flutter/widgets/input.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final bool isOnSearch;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;
  final bool favOption;

  Navbar(
      {this.title = "",
      this.categoryOne = "",
      this.categoryTwo = "",
      this.tags,
      this.transparent = false,
      this.rightOptions = false,
      this.getCurrentPage,
      this.searchController,
      this.isOnSearch = false,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = MyTheme.white,
      this.searchBar = false,
      this.favOption = false});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag;
  bool fav = false;

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    if (widget.tags != null && widget.tags.length != 0) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final bool tagsExist =
        widget.tags == null ? false : (widget.tags.length == 0 ? false : true);
    bool fav = false;

    return Container(
        height: widget.searchBar
            ? (!categories
            ? (tagsExist ? 280.0 : 180.0)
            : (tagsExist ? 280.0 : 230.0))
            : (!categories
            ? (tagsExist ? 180.0 : 130.0)
            : (tagsExist ? 230.0 : 180.0)),
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? MyTheme.initial
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top:0.0), child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(widget.backButton)
                      Padding(padding: const EdgeInsets.only(top:5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: IconButton(
                            padding: EdgeInsets.only(top:12, right:8),
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.arrow_back_ios_new_rounded,
                                color: !widget.transparent
                                    ? (widget.bgColor == MyTheme.white
                                    ? MyTheme.initial
                                    : MyTheme.white)
                                    : MyTheme.white,
                                size: 22.0),
                            onPressed: null),
                      ),),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Text(widget.title,
                              style: TextStyle(
                                  color: !widget.transparent
                                      ? (widget.bgColor == MyTheme.white
                                      ? MyTheme.initial
                                      : MyTheme.white)
                                      : MyTheme.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0)),
                        ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: IconButton(
                                icon: Icon(Icons.notifications_active,
                                    color: !widget.transparent
                                        ? (widget.bgColor == MyTheme.white
                                        ? MyTheme.initial
                                        : MyTheme.white)
                                        : MyTheme.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: IconButton(
                                icon: Icon(Icons.shopping_basket,
                                    color: !widget.transparent
                                        ? (widget.bgColor == MyTheme.white
                                        ? MyTheme.initial
                                        : MyTheme.white)
                                        : MyTheme.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),),

                if (widget.searchBar)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Input(
                        placeholder: "  ¿Qué estás buscando?",
                        controller: widget.searchController,
                        onChanged: widget.searchOnChanged,
                        autofocus: widget.searchAutofocus,
                        suffixIcon:
                        Icon(Icons.zoom_in, color: MyTheme.muted),
                        onTap: () {
                          // ?
                        }),
                  ),
                if (categories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ;
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera,
                                color: MyTheme.initial, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryOne,
                                style: TextStyle(
                                    color: MyTheme.initial,
                                    fontSize: 16.0)),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        color: MyTheme.initial,
                        height: 25,
                        width: 1,
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Row(
                          children: [
                            Icon(Icons.shopping_cart,
                                color: MyTheme.initial, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryTwo,
                                style: TextStyle(
                                    color: MyTheme.initial,
                                    fontSize: 16.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                if (tagsExist)
                  Container(
                    height: 40,
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (activeTag != widget.tags[index]) {
                              setState(() => activeTag = widget.tags[index]);
                              _scrollController.scrollTo(
                                  index:
                                  index == widget.tags.length - 1 ? 1 : 0,
                                  duration: Duration(milliseconds: 420),
                                  curve: Curves.easeIn);
                              if (widget.getCurrentPage != null)
                                widget.getCurrentPage(activeTag);
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 46 : 8, right: 8),
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 20, right: 20),
                              // width: 90,
                              decoration: BoxDecoration(
                                  color: activeTag == widget.tags[index]
                                      ? MyTheme.primary
                                      : MyTheme.secondary,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                              child: Center(
                                child: Text(widget.tags[index],
                                    style: TextStyle(
                                        color: activeTag == widget.tags[index]
                                            ? MyTheme.white
                                            : MyTheme.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0)),
                              )),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        )
    );
  }
}
