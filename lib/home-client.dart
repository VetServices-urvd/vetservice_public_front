
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetservice_public_front/common/utils.dart';
import 'package:vetservice_public_front/views/home-client/home-tab.dart';

import 'components/menus.dart';
import 'main.dart';

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
  String _selectedMenu = '';
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetTabs = <Widget>[
    Text(
      'Index 1: Acceuil',
      style: optionStyle,
    ),
    Text(
      'Index 2: Vos rendez-vous',
      style: optionStyle,
    ),
    Text(
      'Index 3: Carnets de santé',
      style: optionStyle,
    ),
    Text(
      'Index 4: Chat Bot ??',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getTab(){
    var default_tab = Center(
      child: _widgetTabs.elementAt(_selectedIndex),
    );
    return _selectedIndex==0?HomeBottomTab(id:_selectedIndex):default_tab;
  }
  getBottomMenuColor(){
    return _selectedIndex == 0 ?Colors.amberAccent:Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text(widget.title),
              actions: <Widget>[
                  MenuAppBar()
            ]
          ),
          body:getTab(),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil',
                  backgroundColor: Colors.black12
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Mes rendez-vous',
                  backgroundColor: Colors.black12
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Carnets de santé',
                  backgroundColor: Colors.black12
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_services),
                label: 'MedicalNimal Bot',
                  backgroundColor: Colors.black12
              ),
            ],
            currentIndex: _selectedIndex,
            //fixedColor: Colors.,
            selectedItemColor: Colors.amber,
            onTap: _onItemTapped,
          ),
      )
    );
  }
}
