
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetservice_public_front/common/utils.dart';

class InscriptionView extends StatefulWidget{
  InscriptionView({Key? key}): super(key: key);
  final ViewType type = ViewType.INSCRIPTION_USR;
  final String title = 'Inscription';

  @override
  State<StatefulWidget> createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var controllers = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController()
  ] as List<TextEditingController>;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('${widget.title}'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top:70, bottom: 40, right:80),
                    child: TextButton( onPressed: () =>  Navigator.pop(context),
                        child: Text("Se connecter")),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 30, left:50, right: 50),
                      child:TextFormField(
                        controller: controllers[0],
                        decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            label: Text('Nom')
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
                      margin: const EdgeInsets.only(bottom: 30, left:50, right: 50),
                      child:TextFormField(
                        controller: controllers[1],
                        decoration: const InputDecoration(
                            icon: const Icon(Icons.person_outline),
                            label: Text('Prenom')
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
                      margin: const EdgeInsets.only(bottom: 30, left:50, right: 50),
                      child:TextFormField(
                        controller: controllers[2],
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
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 50, left:50, right: 50),
                    child: TextFormField(
                      controller: controllers[3],
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.password),
                          label: Text('Mot de passe'),
                      ),
                      obscureText: true,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 50, left:50, right: 50),
                    child: TextFormField(
                      controller: controllers[4],
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.password),
                          label: Text('Confirmation mot de passe')
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs vide!';
                        } else if (controllers[3].text != value && value.isNotEmpty) {
                          return 'Les mots de passe ne match pas!';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( right: 150),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controllers.forEach((element) => print('form val ${element.text}'));
                          Navigator.pushNamed(context, ViewType.AUTHENTIFCATION.endpoint);
                        }
                      },
                      child: const Icon(Icons.send),
                    ),
                  )
                ]
            ),
          )
        )
    );
  }
}