import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './main.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _ListTesteState();
}

class _ListTesteState extends State<Teste> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text('TESTE'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Expanded(
                    child: Center(
                      child: Text('Word1'),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Word2'),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Word4'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: const <Widget>[
            Text('Deliver features faster'),
            Text('Craft beautiful UIs'),
            Expanded(
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
