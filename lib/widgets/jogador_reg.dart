import 'package:intl/intl.dart';
import '../lib.dart';
import '../models/jogador.dart';
import './jogador_edit.dart';
import './hist_contrat_list.dart';

class JogadorReg extends StatefulWidget {
  final Jogador jogadorReg;

  const JogadorReg({Key? key, required this.jogadorReg}) : super(key: key);

  @override
  State<JogadorReg> createState() => _JogadorRegState();
}

class _JogadorRegState extends State<JogadorReg> {
  // final Jogador jogadorReg;

  // _JogadorRegState({Key key, @required this.jogadorReg}) : super(key: key);
  bool _active = false;
  void refreshPage() {
    setState(() {
      _active = !_active;
    });
  }

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
            Text(
              "Nome: ${widget.jogadorReg.nome}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              //Foi adicionado à string da idade o numero de registo de forma a poder-se facilmente adicionar contratos
              "Idade: ${widget.jogadorReg.idade ?? 'N/A'}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
            Row(children: <Widget>[
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
            Text(
              "Data Ultimo Controlo Dooping: ${widget.jogadorReg.dataUltCtrlDopp != null ? DateFormat("dd-MM-yyyy").format(widget.jogadorReg.dataUltCtrlDopp!) : 'N/A'}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
            ElevatedButton(
              child: const Text("Contratos"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) =>
                            HistContratList(idJogador: widget.jogadorReg.id)))
                    .then((value) => refreshPage());
              },
              // {
              //   const HistContratList();
              // },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(
          //   height: 40,
          //   width: 40,
          //   child: FloatingActionButton(
          //       onPressed: () {
          //         // _showDeletionDialog();

          //         // objectbox.jogadorBox.remove(widget.jogadorReg.id);
          //       },
          //       child: const Icon(Icons.delete_forever_outlined)),
          // ),
          // const SizedBox(width: 60),
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
                child: Icon(Icons.border_color)),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeletionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                print('Confirmed');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
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


// class _JogadorRegState extends State<JogadorReg> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () {
//       //   Navigator.of(context).push(MaterialPageRoute(
//       //       builder: (context) => TaskPage(event: widget.event)));
//       // },
//       child: Container(
//         margin: const EdgeInsets.all(5),
//         child: Column(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 243, 243, 243),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 168, 168, 168),
//                     blurRadius: 5,
//                     offset: Offset(1, 2),
//                   )
//                 ],
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           padding: const EdgeInsets.all(5),
//                           child: Text(
//                             widget.jogadorReg.nome,
//                             style: const TextStyle(
//                                 fontSize: 25.0,
//                                 height: 1.0,
//                                 overflow: TextOverflow.fade),
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text("Idade: ${widget.jogadorReg.idade}",
//                                   style: const TextStyle(
//                                       fontSize: 15.0,
//                                       height: 1.0,
//                                       overflow: TextOverflow.fade)),
//                               const Spacer(),
//                               Text(
//                                   "Ult Ctrl AntiDopping: ${DateFormat('dd.MM.yyyy').format(widget.jogadorReg.dataUltCtrlDopp!)}",
//                                   style: const TextStyle(
//                                       fontSize: 15.0,
//                                       height: 1.0,
//                                       overflow: TextOverflow.fade))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
