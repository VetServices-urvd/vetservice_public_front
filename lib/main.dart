import 'package:flutter/material.dart';
import 'package:vetservice_public_front/authentification.dart';
import 'package:vetservice_public_front/home-client.dart';

import 'inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
     

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
      //   if (settings.name == '/') {
      //     return MaterialPageRoute(builder: (context) => AuthentView());
      //   }

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
      body: Center(

          child:Text("${DEFAULT_CONTENT}", textAlign: TextAlign.justify)
      )
    );
  }

}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
