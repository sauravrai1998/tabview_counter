import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(StartPage());
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "New Task",
        theme: ThemeData(
        primarySwatch: Colors.red,),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _counter = 40;
  int _counter2 = 40;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter2--;
    });
  }

  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this,initialIndex: 0);

    _tabController.addListener(_handleTabIndex);
  }
  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onBackPressed,child: new Scaffold(
    appBar: new AppBar(
    title: new Text("TabView_Task"),
    centerTitle: true,
        actions: <Widget>[
    Padding(
    padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => exit(0),
          child: Icon(
            Icons.exit_to_app,
            size: 26.0,
          ),
        )
    ),
        ],

    bottom: TabBar(
    controller: _tabController,
    unselectedLabelColor: Colors.white38,
    labelColor: Colors.white,
    tabs: [

    new Tab(text: 'Increment_tab',
    icon: new Icon(Icons.arrow_circle_up),),
    new Tab(
    text: 'Decrement_tab',
    icon: new Icon(Icons.arrow_circle_down),
    ),
    ],
    indicatorColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.tab,),
    bottomOpacity: 1,
    ),
    body: TabBarView(controller: _tabController,
    children: [
    Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Text('Press +1 Button to increase the below counter'),
    SizedBox(height: 50,
    ),
    Text('$_counter',
    style: Theme.of(context).textTheme.display1,),
    ],

    ),
    ),
    Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Text('Press -1 Button to decrease the below counter'),
    SizedBox(height: 50,
    ),
    Text('$_counter2',
    style: Theme.of(context).textTheme.display1,),
    ],
    ),
    ),
    ],
    ),
    floatingActionButton: _bottomButtons(), )

    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 40,width: 100,),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("YES"),

          ),
          SizedBox(width: 40,),
        ],
      ),
    ) ??
        false;
  }
  Widget _bottomButtons() {
    return _tabController.index == 0
        ? FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: _incrementCounter,
        tooltip: 'Addition by 1',
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.exposure_plus_1_outlined,
          size: 20.0,
        ))
        : FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: _decrementCounter,
      tooltip: 'Subtract by 1',
      backgroundColor: Colors.redAccent,
      child: Icon(
        Icons.exposure_minus_1,
        size: 20.0,
      ),
    );
  }
}
