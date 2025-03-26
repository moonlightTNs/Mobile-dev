import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _clickedItem = '';

  void _handleItemClick(String item) {
    setState(() {
      _clickedItem = item;
    });
    print('$item tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: <Widget>[
          Text('Clicked Item: $_clickedItem'),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () => _handleItemClick('Item 1'),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Item 1'),
                    subtitle: Text('Subtitle for Item 1'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () => _handleItemClick('Item 2'),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Item 2'),
                    subtitle: Text('Subtitle for Item 2'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () => _handleItemClick('Item 3'),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Item 3'),
                    subtitle: Text('Subtitle for Item 3'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () => _handleItemClick('Item 4'),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Item 4'),
                    subtitle: Text('Subtitle for Item 4'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: () => _handleItemClick('Item 5'),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Item 5'),
                    subtitle: Text('Subtitle for Item 5'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}