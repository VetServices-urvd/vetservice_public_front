
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetservice_public_front/common/utils.dart';

// class HomeClientView extends StatefulWidget{
//   HomeClientView({this.usr});
//   final ViewType type = ViewType.INSCRIPTION_USR;
//   final String title = 'Espace client Vetservice';
//   final String? usr;
//
//   @override
//   State<StatefulWidget> createState() => _HomeClientViewState();
// }

// class _HomeClientViewState extends State<HomeClientView>{
//   @override
//   Widget build(BuildContext context) {
//     return ();
//   }
// }
class HomeClientView extends StatefulWidget {
  const HomeClientView({Key? key, this.usr}) : super(key: key);
  final ViewType type = ViewType.HOME_USR;
  final String title = 'Espace client Vetservice';
  final String? usr;
  @override
  State<HomeClientView> createState() => _HomeClientViewState();
}

class _HomeClientViewState extends State<HomeClientView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}