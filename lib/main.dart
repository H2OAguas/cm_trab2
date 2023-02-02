// import 'dart:async';
// import 'package:flutter/material.dart';
// import './widgets/jog_list_ctrl_dopp.dart';
// // import './teste.dart';
// import './widgets/app_bar.dart';
// import 'objectbox.dart';

import 'lib.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   objectbox = await ObjectBox.create();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             CtrlDoppList(),
//             // const Text(
//             //   'You have pushed the button this many times:',
//             // ),
//             // Text(
//             //   '$_counter',
//             //   style: Theme.of(context).textTheme.headline4,
//             // ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: MyAppBar(),
        body: CtrlDoppList(),
      ),
    );
  }
}
