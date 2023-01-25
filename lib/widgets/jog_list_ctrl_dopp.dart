import '../lib.dart';
import './jogador_card.dart';
import '../models/jogador.dart';
import '../data/jogadores.dart';
import '../data/hist_contrats.dart';

/// Generates and returns a widget with list of events stored in the Box.
class CtrlDoppList extends StatefulWidget {
  const CtrlDoppList({Key? key}) : super(key: key);

  @override
  State<CtrlDoppList> createState() => _CtrlDoppListState();
}

class _CtrlDoppListState extends State<CtrlDoppList> {
  Jogadores jogadores = Jogadores();
  HistContrats histContrats = HistContrats();
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
          list_controlo_antiDopp(context),
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
          list_contrato_expering(context),
        ]),
      ),
    );
  }

  @override
  Widget list_controlo_antiDopp(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 300,
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

  @override
  Widget list_contrato_expering(BuildContext context) {
    // double screenHeight = WidgetsBinding.instance.window.physicalSize.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 300,
            child: StreamBuilder<List<Jogador>>(
              stream: histContrats.getHistContratExpering(),
              builder: (context, snapshot) {
                if (snapshot.data?.isNotEmpty ?? false) {
                  return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: _itemBuilder(snapshot.data ?? []));
                } else {
                  return const Center(
                      child: Text(
                          "Não existem contratos a expirar nos próximos 6 meses"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
