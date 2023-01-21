// import 'dart:async';
// import 'package:flutter/material.dart';
// import './widgets/jog_list_ctrl_dopp.dart';
// // import './teste.dart';
// import './widgets/app_bar.dart';
// import 'objectbox.dart';

import 'lib.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
  runApp(const CtrlDoppList());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: MyAppBar(),
              body: Column(
                children: const [
                  CtrlDoppList(),
                ],
              ),
            ),
          );

          // @override
          // Widget build(BuildContext context) {
          //   return MaterialApp(
          //     title: 'ObjectBox Relations Application',
          //     theme: ThemeData(
          //       primarySwatch: Colors.blue,
          //     ),
          //     home: const MyHomePage(),
          //   );
          // }
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Jogadores com mais de 6 meses control AntiDopping"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Column(
//           children: const [
//             Expanded(child: CtrlDoppList()),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //     onPressed: () {
//       //       Navigator.of(context).push(
//       //           MaterialPageRoute(builder: (context) => const AddEvent()));
//       //     },
//       //     child: const Text("+", style: TextStyle(fontSize: 29))),
//     );
//   }
// }
