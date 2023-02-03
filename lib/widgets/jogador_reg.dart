import 'package:intl/intl.dart';
import '../lib.dart';
import '../models/jogador.dart';
import '../models/hist_contrat.dart';
import '../data/hist_contrats.dart';
import './hist_contrat_add.dart';
import './jogador_edit.dart';
import '../widgets/hist_contrat_card.dart';

class JogadorReg extends StatefulWidget {
  final Jogador jogadorReg;

  const JogadorReg({Key? key, required this.jogadorReg}) : super(key: key);

  @override
  State<JogadorReg> createState() => _JogadorRegState();
}

class _JogadorRegState extends State<JogadorReg> {
  bool _active = false;
  void refreshPage() {
    setState(() {
      _active = !_active;
    });
  }

  HistContrats histContrats = HistContrats();
  HistContratCard Function(BuildContext, int) _itemBuilder(
          List<HistContrat> histContrats) =>
      (BuildContext context, int index) =>
          HistContratCard(histContrat: histContrats[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                color: Colors.blue[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ficha do jogador ${widget.jogadorReg.nome}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20.0,
                          height: 1.0,
                          overflow: TextOverflow.fade)),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Text(
                "Nome: ${widget.jogadorReg.nome}",
                style: const TextStyle(
                    fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: Text(
                //Foi adicionado à string da idade o numero de registo de forma a poder-se facilmente adicionar contratos
                "Idade: ${widget.jogadorReg.idade ?? 'N/A'}",
                style: const TextStyle(
                    fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
              ),
            ),
            SizedBox(
              child: Row(children: <Widget>[
                const Text(
                  "Ativo: ",
                  style: TextStyle(
                      fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
                ),
                Checkbox(
                    activeColor: Colors.green,
                    value: widget.jogadorReg.ativo,
                    onChanged: null),
              ]),
            ),
            SizedBox(
              height: 60,
              child: Text(
                "Data Ultimo Controlo Dooping: ${widget.jogadorReg.dataUltCtrlDopp != null ? DateFormat("dd-MM-yyyy").format(widget.jogadorReg.dataUltCtrlDopp!) : 'N/A'}",
                style: const TextStyle(
                    fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
              ),
            ),
            SizedBox(
              child: Text(
                //Foi adicionado à string da idade o numero de registo de forma a poder-se facilmente adicionar contratos
                "Nº dias de contrato: ${histContrats.getHistContratsNdias(widget.jogadorReg.id)}",
                style: const TextStyle(
                    fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
              ),
            ),
            // ElevatedButton(
            //   child: const Text("Contratos"),
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(
            //             builder: (context) =>
            //                 HistContratList(idJogador: widget.jogadorReg.id)))
            //         .then((value) => refreshPage());
            //   },
            // ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                const Text(
                  "Contratos",
                  style: TextStyle(
                      fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => HistContratAdd(
                                  // idJogador: widget.jogadorReg.id)))
                                  histContratJogador: widget.jogadorReg)))
                          .then((value) => refreshPage());
                    },
                    // child: const Text("+", style: TextStyle(fontSize: 29))),
                    heroTag: null,
                    child: const Icon(Icons.add_card_rounded),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              // HistContratList(idJogador: widget.jogadorReg.id),
              child: StreamBuilder<List<HistContrat>>(
                stream: histContrats.getHistContratsId(widget.jogadorReg.id),
                builder: (context, snapshot) {
                  if (snapshot.data?.isNotEmpty ?? false) {
                    return ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                        itemBuilder: _itemBuilder(snapshot.data ?? []));
                  } else {
                    return const Center(
                        child: Text("Não existem contratos em vigor"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: FloatingActionButton(
                onPressed: () {
                  _showDeletionDialog(context, widget.jogadorReg.id);
                },
                heroTag: null,
                child: const Icon(Icons.delete_forever_outlined)),
          ),
          const SizedBox(width: 60),
          SizedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) =>
                            JogadorEdit(jogadorEdit: widget.jogadorReg)))
                    .then((value) => refreshPage());
              },
              // child: const Text("+", style: TextStyle(fontSize: 29))),
              heroTag: null,
              child: const Icon(Icons.border_color),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeletionDialog(BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue[50],
          title: Text('Confirmação'),
          elevation: 24.0,
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('O jogador será eliminado permanentemente.'),
                SizedBox(
                  height: 20,
                ),
                Text('Confirma a eliminação ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                objectbox.jogadorBox.remove(id);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
