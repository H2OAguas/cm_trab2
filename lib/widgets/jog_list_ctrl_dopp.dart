import '../lib.dart';
import 'dart:ui';
import './jogador_card.dart';
// import '../main.dart';
import '../models/jogador.dart';
import '../data/jogadores.dart';
import 'app_bar.dart';

/// Generates and returns a widget with list of events stored in the Box.
class CtrlDoppList extends StatefulWidget {
  const CtrlDoppList({Key? key}) : super(key: key);

  @override
  State<CtrlDoppList> createState() => _CtrlDoppListState();
}

class _CtrlDoppListState extends State<CtrlDoppList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  Jogadores jogadores = Jogadores();
  // double pixelRatio = window.devicePixelRatio;
  // double screenHeight = window.physicalSize.height / pixelRatio;
  JogadorCard Function(BuildContext, int) _itemBuilder(
          List<Jogador> jogadores) =>
      (BuildContext context, int index) =>
          JogadorCard(jogador: jogadores[index]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Controlo AntiDopping",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
            ),
          ),
          list_jogadores_card(context),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Controlo Contratos",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
            ),
          ),
          list_jogadores_card(context),
        ]),
      ),
    );
  }

  @override
  Widget list_jogadores_card(BuildContext context) {
    double screenHeight = WidgetsBinding.instance.window.physicalSize.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 340,
            child: StreamBuilder<List<Jogador>>(
              stream: jogadores.getJogadoresCtrlDopp(),
              builder: (context, snapshot) {
                if (snapshot.data?.isNotEmpty ?? false) {
                  return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: _itemBuilder(snapshot.data ?? []));
                } else {
                  return const Center(
                      child: Text("Press the + icon to add a player"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
