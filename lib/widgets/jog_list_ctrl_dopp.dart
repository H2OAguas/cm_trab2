import 'package:event_manager_objectbox/models/jogador.dart';
import 'package:flutter/material.dart';
import './jogador_card.dart';
// import '../main.dart';
import '../data/jogadores.dart';

/// Generates and returns a widget with list of events stored in the Box.
class CtrlDoppList extends StatefulWidget {
  const CtrlDoppList({Key? key}) : super(key: key);
  @override
  State<CtrlDoppList> createState() => _CtrlDoppListState();
}

class _CtrlDoppListState extends State<CtrlDoppList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  Jogadores jogadores = Jogadores();

  JogadorCard Function(BuildContext, int) _itemBuilder(
          List<Jogador> jogadores) =>
      (BuildContext context, int index) =>
          JogadorCard(jogador: jogadores[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing App"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Simple Calculator',
              style: TextStyle(fontSize: 24),
            ),
            Expanded(
              child: StreamBuilder<List<Jogador>>(
                  stream: jogadores.getJogadoresCtrlDopp(),
                  builder: (context, snapshot) {
                    if (snapshot.data?.isNotEmpty ?? false) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              snapshot.hasData ? snapshot.data!.length : 0,
                          itemBuilder: _itemBuilder(snapshot.data ?? []));
                    } else {
                      return const Center(
                          child: Text("Press the + icon to add a player"));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  // Widget build1(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: SelectionArea(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: const <Widget>[
  //             Text('Selectable text'),
  //             SelectionContainer.disabled(child: Text('Non-selectable text')),
  //             Text('Selectable text'),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
