

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetservice_public_front/common/utils.dart';

class AuthentView extends StatefulWidget{
  AuthentView({super.key, this.user = ''});
  final ViewType type = ViewType.AUTHENTIFCATION;
  final String user;
  final String title = 'Connection';
  @override
  State<StatefulWidget> createState() => _AuthentViewState();
}

class _AuthentViewState extends State<AuthentView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var controllers = [
    new TextEditingController(),
    new TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(onWillPop: () async => false,
        child:Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('${widget.title}'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:100, bottom: 40, right:80),
                  child: TextButton( onPressed: () =>  Navigator.pushNamed(context, ViewType.INSCRIPTION_USR.endpoint),
                      child: Text("S'inscrire")),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 30, left:50, right: 50),
                    child:TextFormField(
                      controller: controllers[0],
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.mail),
                          label: Text('Email')
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide!';
                        }else if(!EmailValidator.validate(value)) {
                          return 'Email incorrect!';
                        }
                        return null;
                      },
                    ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 50, left:50, right: 50),
                  child: TextFormField(
                    controller: controllers[1],
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.password),
                        label: Text('Mot de passe')
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs vide!';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( right: 150),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controllers.forEach((element) => print('form val ${element.text}'));
                        String username = "username_name";

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString(SharedKey.USER_AUTH.name, username);

                        Navigator.pushNamed(context, ViewType.HOME_USR.endpoint + '/' + username);
                      }
                    },
                    child: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}