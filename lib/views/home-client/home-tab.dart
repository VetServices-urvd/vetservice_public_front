import 'package:flutter/material.dart';
import 'package:vetservice_public_front/home-client.dart';

class HomeBottomTab extends StatefulWidget {
  const HomeBottomTab({Key? key, this.id = 0}) : super(key: key);
  final int id;
  final String tab_title = 'Accueil';
  @override
  State<HomeBottomTab> createState() {
    switch (id) {
      case 0:
        return _HomeClientTabState();
    // case 1:
    //   return _GestionRdvTabState();
    // case 2:
    //   return _ChatState()
      default:
        return _HomeClientTabState();
    }
  }
}
class _HomeClientTabState extends State<HomeBottomTab>{
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top:5,bottom: 50),
          child: Text(widget.tab_title,
              style: Theme.of(context).textTheme.headline5
          ),
        ),
      ],
    );
  }
}