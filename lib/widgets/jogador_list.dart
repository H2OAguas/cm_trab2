import '../lib.dart';
import './jogador_card.dart';
// import '../main.dart';
import '../models/jogador.dart';
import '../data/jogadores.dart';
import 'app_bar.dart';

/// Generates and returns a widget with list of events stored in the Box.
class JogadorList extends StatefulWidget {
  const JogadorList({Key? key}) : super(key: key);
  @override
  State<JogadorList> createState() => _JogadorListState();
}

class _JogadorListState extends State<JogadorList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  Jogadores jogadores = Jogadores();

  JogadorCard Function(BuildContext, int) _itemBuilder(
          List<Jogador> jogadores) =>
      (BuildContext context, int index) =>
          JogadorCard(jogador: jogadores[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lista de Jogadores",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
        ),
        _listJogadoresCard(context),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Widget _listJogadoresCard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 540,
            child: StreamBuilder<List<Jogador>>(
              stream: jogadores.getJogadoresLista(),
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
