

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top:100, bottom: 40, right:80),
                child: TextButton( onPressed: () {  }, child: Text("S'inscrire")),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 30, left:50, right: 50),
                  child:TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.mail),
                        label: Text('Email')
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs vide!';
                      }
                      return null;
                    },
                  )
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 50, left:50, right: 50),
                child: TextFormField(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 150),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}