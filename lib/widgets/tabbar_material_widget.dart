import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    @required this.index,
    @required this.onChangedTab,
    Key key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      //notchMargin: 16,
      child: Container(

        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(Icons.home),
          ),
          buildTabItem(
            index: 1,
            icon: Icon(Icons.favorite_border),
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(Icons.notifications_active),
          ),
          buildTabItem(
            index: 3,
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],

      ),
      ),
    );
  }

  Widget buildTabItem({
    @required int index,
    @required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.red : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
