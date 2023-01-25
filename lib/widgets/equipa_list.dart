import '../lib.dart';
import './equipa_card.dart';
import '../models/equipa.dart';
import '../data/equipas.dart';

//Retorna uma lista de equipas
class EquipaList extends StatefulWidget {
  const EquipaList({Key? key}) : super(key: key);
  @override
  State<EquipaList> createState() => _EquipaListState();
}

class _EquipaListState extends State<EquipaList> {
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
