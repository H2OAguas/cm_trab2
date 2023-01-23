import '../lib.dart';
import './hist_contrat_card.dart';
// import '../main.dart';
import '../models/hist_contrat.dart';
import '../data/hist_contrats.dart';
import 'app_bar.dart';

/// Generates and returns a widget with list of events stored in the Box.
class HistContratList extends StatefulWidget {
  final int idJogador;

  const HistContratList({Key? key, required this.idJogador}) : super(key: key);
  @override
  State<HistContratList> createState() => _HistContratListState();
}

class _HistContratListState extends State<HistContratList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  HistContrats histContrats = HistContrats();

  HistContratCard Function(BuildContext, int) _itemBuilder(
          List<HistContrat> histContrats) =>
      (BuildContext context, int index) =>
          HistContratCard(histContrat: histContrats[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lista de Contratos",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
        ),
        list_histContrats_card(context),
        const SizedBox(
          height: 10,
        ),
        // const Text(
        //   "Controlo Contratos",
        //   style: TextStyle(
        //     color: Colors.blue,
        //     fontSize: 16.0,
        //   ),
        // ),
        // list_jogadores_card(context),
      ]),
    );
  }

  Widget list_histContrats_card(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 640,
            child: StreamBuilder<List<HistContrat>>(
              stream: histContrats.getHistContratsId(widget.idJogador),
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
