import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vetservice_public_front/authentification.dart';
import 'package:vetservice_public_front/common/utils.dart';
import 'package:vetservice_public_front/home-client.dart';

import 'inscription.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    //this.prefs = SharedPreferences.getInstance();
  }
  final dynamic prefs = SharedPreferences.getInstance();
  getUser(){
    prefs.get(SharedKey.USER_AUTH);
  }

  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.grey,
    //     ),
    //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   );
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AuthentView(),
        '/authentification': (context) => AuthentView(),
        '/inscription': (context) => InscriptionView(),
        '/home/:usr': (context) => HomeClientView(),
        '/default': (context) => DefaultView(),
      },
      onGenerateRoute: (settings) {
      //   // Handle '/'
        if (settings.name!.contains('auth')) {
          var usr = getUser();
          return usr == null? MaterialPageRoute(builder: (context) => AuthentView()):
              MaterialPageRoute(builder: (context) => HomeClientView(usr:usr));
        }

        //Handle '/details/:id'
        // if (settings.name && settings.name?.contains( 'home')) {
          var url = settings.name;
          var uri = Uri.parse(url!);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'home') {
            var usr = uri.pathSegments[1];
            return MaterialPageRoute(builder: (context) => usr == null || usr == ''?HomeClientView(usr: 'default'):HomeClientView(usr:usr));
          }
        //}


        //return MaterialPageRoute(builder: (context) => DefaultView());
      },
      //onUnknownRoute: ((context) => DefaultView()),
    );
  }
}
class DefaultView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DefaultViewState();

}

class _DefaultViewState extends State<DefaultView>{
  static final DEFAULT_CONTENT = "Page de maintenence:\n Une erreur est survenu veuiilez vous reconnecter.\n Si l'erreur persiste, reconnecter vous ultérieurement";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Page d'erreur", textAlign: TextAlign.center)
      ),
      body: DefaultBodyContent(content: DEFAULT_CONTENT)
    );
  }

}

class DefaultBodyContent extends StatelessWidget{
  DefaultBodyContent({super.key, this.content});

  var _MESSAGE = "Page par default:\n Retourner à la page d'accueil ou à la page de connetion !";
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Text(content ?? _MESSAGE,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headline3
        )
    );
  }

}

