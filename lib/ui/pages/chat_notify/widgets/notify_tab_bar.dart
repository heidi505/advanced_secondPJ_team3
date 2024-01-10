import 'package:flutter/material.dart';

class NotifyTabPage extends StatefulWidget {
  NotifyTabPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<NotifyTabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_car), text: '자동차',),
              Tab(icon: Icon(Icons.directions_transit), text: '지하철',),
              Tab(icon: Icon(Icons.directions_bike), text: '자전거',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FirstTab(),
            SecondTab(),
            ThirdTab(),
          ],
        ),
      ),
    );
  }
}