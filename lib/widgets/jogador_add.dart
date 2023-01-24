import 'package:intl/intl.dart';
import '../lib.dart';
import '../models/jogador.dart';
import './jogador_edit.dart';
import './hist_contrat_list.dart';

class JogadorAdd extends StatefulWidget {
  const JogadorAdd({Key? key}) : super(key: key);

  @override
  State<JogadorAdd> createState() => _JogadorAddState();
}

class _JogadorAddState extends State<JogadorAdd> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _idade;
  late bool _ativo = true;
  late DateTime? _dataUltCtrlDopp = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir jogador'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Column(children: <Widget>[
              TextFormField(
                style: const TextStyle(fontSize: 22),
                // initialValue: _nome,
                decoration: const InputDecoration(
                    labelText: 'Nome', labelStyle: TextStyle(fontSize: 20)),
                onChanged: (value) => _nome = value,
                // _nome = value!,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 22),
                // initialValue: _idade,
                decoration: const InputDecoration(
                    labelText: 'Idade', labelStyle: TextStyle(fontSize: 20)),
                onChanged: (value) => _idade = value,
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CheckboxListTile(
                  // controlAffinity: ListTileControlAffinity.platform,
                  value: true,
                  activeColor: Colors.green,
                  title: const Text(
                    'Ativo',
                    // textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20.0,
                        height: 1.0,
                        overflow: TextOverflow.fade),
                    textAlign: TextAlign.left,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _ativo = value!;
                    });
                  },
                ),
                Text(
                  "Último control Anti Dopping: ${DateFormat('dd.MM.yyyy').format(_dataUltCtrlDopp!)}",
                  style: const TextStyle(
                      fontSize: 18.0, height: 1.0, overflow: TextOverflow.fade),
                ),
                // const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        "Alterar data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2050))
                            .then((date) {
                          setState(() {
                            _dataUltCtrlDopp = date;
                          });
                        });
                      },
                    ),
                  ),
                ),
                // const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final jogadorAdd =
                        Jogador(_nome, _idade, _dataUltCtrlDopp, ativo: _ativo);
                    objectbox.jogadorBox.put(jogadorAdd);
                    Navigator.pop(context);
                  },
                  child: Text('Gravar'),
                ),
              ],
            ),
          ]),
        ),
      ),
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
