import '../lib.dart';
import './equipa_card.dart';
// import '../main.dart';
import '../models/equipa.dart';
import '../data/equipas.dart';
import 'app_bar.dart';

/// Generates and returns a widget with list of events stored in the Box.
class EquipaList extends StatefulWidget {
  const EquipaList({Key? key}) : super(key: key);
  @override
  State<EquipaList> createState() => _EquipaListState();
}

class _EquipaListState extends State<EquipaList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  Equipas equipas = Equipas();

  EquipaCard Function(BuildContext, int) _itemBuilder(List<Equipa> equipas) =>
      (BuildContext context, int index) => EquipaCard(equipa: equipas[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lista de Equipas",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
        ),
        list_equipas_card(context),
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

  @override
  Widget list_equipas_card(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 640,
            child: StreamBuilder<List<Equipa>>(
              stream: equipas.getEquipas(),
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
