
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetservice_public_front/common/utils.dart';

class MenuAppBar extends StatefulWidget {
  MenuAppBar({super.key});
  @override
  State<StatefulWidget> createState() =>_MenuAppBarState();
}
enum MenuHomeType {
  Compte(label:'Compte'),
  Marketplace(label:'Marketplace'),
  Deconnexion(label:'Déconnetion');

  const MenuHomeType({required this.label});
  final String label;
}

class _MenuAppBarState extends State<MenuAppBar>{
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuHomeType>(
        icon:const Icon(Icons.more_vert),
        onSelected: (MenuHomeType item) {
          setState(() {
            _selectedMenu = item.name;
          });
        },
        itemBuilder: (context) => <PopupMenuEntry<MenuHomeType>>[
          PopupMenuItem<MenuHomeType>(
            value: MenuHomeType.Compte,
            child: ListTile(
                leading: Icon(Icons.account_circle),
                title:Text(MenuHomeType.Compte.label)
            ),
          ),
          PopupMenuItem<MenuHomeType>(
            value: MenuHomeType.Marketplace,
            child: ListTile(
                leading: Icon(Icons.store),
                title:Text(MenuHomeType.Marketplace.label)
            ),
          ),
          PopupMenuItem<MenuHomeType>(
            value: MenuHomeType.Deconnexion,
            child: ListTile(
                leading: Icon(Icons.logout_outlined),
                title:Text(MenuHomeType.Deconnexion.label),
                onTap:() async {
                  final pref = await SharedPreferences.getInstance();
                  if(pref.getString(SharedKey.USER_AUTH.name) != null){
                    pref.remove(SharedKey.USER_AUTH.name);
                  }
                  Navigator.pushNamed(context,ViewType.AUTHENTIFCATION.endpoint);
                },
            ),
          ),
        ]
    );
  }
}