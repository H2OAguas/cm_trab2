import 'package:intl/intl.dart';
import '../lib.dart';
import '../models/jogador.dart';

class JogadorEdit extends StatefulWidget {
  final Jogador jogadorEdit;

  const JogadorEdit({Key? key, required this.jogadorEdit}) : super(key: key);

  @override
  State<JogadorEdit> createState() => _JogadorEditState();
}

class _JogadorEditState extends State<JogadorEdit> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _idade;
  late bool _ativo;
  late DateTime? _dataUltCtrlDopp;

  @override
  void initState() {
    super.initState();
    _nome = widget.jogadorEdit.nome;
    _idade = widget.jogadorEdit.idade ?? '';
    _ativo = widget.jogadorEdit.ativo;
    _dataUltCtrlDopp = widget.jogadorEdit.dataUltCtrlDopp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar jogador ${widget.jogadorEdit.nome}'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Column(children: <Widget>[
              TextFormField(
                style: const TextStyle(fontSize: 22),
                initialValue: _nome,
                decoration: const InputDecoration(
                    labelText: 'Nome', labelStyle: TextStyle(fontSize: 20)),
                onChanged: (value) => _nome = value,
                // _nome = value!,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 22),
                initialValue: _idade,
                decoration: const InputDecoration(
                    labelText: 'Idade', labelStyle: TextStyle(fontSize: 20)),
                onChanged: (value) => _idade = value,
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CheckboxListTile(
                  value: _ativo,
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
                  "Último control Anti Dopping: ${DateFormat("dd-MM-yyyy").format(_dataUltCtrlDopp!)}",
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
                                firstDate: DateTime(2022),
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
                    widget.jogadorEdit.nome = _nome;
                    widget.jogadorEdit.idade = _idade;
                    widget.jogadorEdit.ativo = _ativo;
                    widget.jogadorEdit.dataUltCtrlDopp = _dataUltCtrlDopp;
                    objectbox.jogadorBox.put(widget.jogadorEdit);
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Editar jogador ${widget.jogadorEdit.nome}'),
  //     ),
  //     body: Form(
  //       key: _formKey,
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               style: const TextStyle(fontSize: 22),
  //               initialValue: _nome,
  //               decoration: const InputDecoration(
  //                   labelText: 'Nome', labelStyle: TextStyle(fontSize: 20)),
  //               onChanged: (value) => _nome = value,
  //               // _nome = value!,
  //             ),
  //             TextFormField(
  //               style: const TextStyle(fontSize: 22),
  //               initialValue: _idade,
  //               decoration: const InputDecoration(
  //                   labelText: 'Idade', labelStyle: TextStyle(fontSize: 20)),
  //               onChanged: (value) => _idade = value,
  //             ),
  //             Column(
  //               // crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: <Widget>[
  //                 CheckboxListTile(
  //                   // controlAffinity: ListTileControlAffinity.platform,
  //                   value: _ativo,
  //                   title: const Text(
  //                     'Ativo',
  //                     // textAlign: TextAlign.right,
  //                     style: TextStyle(
  //                         fontSize: 20.0,
  //                         height: 1.0,
  //                         overflow: TextOverflow.fade),
  //                   ),
  //                   onChanged: (value) {
  //                     setState(() {
  //                       _ativo = value!;
  //                     });
  //                   },
  //                 ),

  //                 Text(
  //                   "Último control Anti Dopping: ${DateFormat("dd-MM-yyyy").format(_dataUltCtrlDopp!)}",
  //                   style: const TextStyle(
  //                       fontSize: 18.0,
  //                       height: 1.0,
  //                       overflow: TextOverflow.fade),
  //                 ),
  //                 // const Spacer(),
  //                 Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                     child: TextButton(
  //                       child: const Text("Alterar data",
  //                           style: TextStyle(fontWeight: FontWeight.bold)),
  //                       onPressed: () {
  //                         showDatePicker(
  //                                 context: context,
  //                                 initialDate: DateTime.now(),
  //                                 firstDate: DateTime(2022),
  //                                 lastDate: DateTime(2050))
  //                             .then((date) {
  //                           setState(() {
  //                             _dataUltCtrlDopp = date;
  //                           });
  //                         });
  //                       },
  //                     )),
  //                 const Spacer(),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     // if (_formKey.currentState.validate()) {
  //                     //   _formKey.currentState.save();
  //                     widget.jogadorEdit.nome = _nome;
  //                     widget.jogadorEdit.idade = _idade;
  //                     widget.jogadorEdit.ativo = _ativo;
  //                     widget.jogadorEdit.dataUltCtrlDopp = _dataUltCtrlDopp;
  //                     objectbox.jogadorBox.put(widget.jogadorEdit);
  //                     // JogadorReg(jogadorReg: widget.jogadorEdit);
  //                     Navigator.pop(context);
  //                     // Navigator.pop(context);
  //                     // new JogadorReg(jogadorReg: widget.jogadorEdit);

  //                     // }
  //                   },
  //                   child: Text('Gravar'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


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
