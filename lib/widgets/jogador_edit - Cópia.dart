import 'package:gestao_futebol/widgets/jogador_reg.dart';

import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/jogador.dart';

class JogadorEdit extends StatefulWidget {
  final Jogador jogadorEdit;

  const JogadorEdit({Key? key, required this.jogadorEdit}) : super(key: key);

  @override
  _JogadorEditState createState() => _JogadorEditState();
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
        title: Text('Edit Jogador'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                initialValue: _idade,
                decoration: InputDecoration(labelText: 'Idade'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => _idade = value!,
              ),
              CheckboxListTile(
                value: _ativo,
                title: Text('Ativo'),
                onChanged: (value) {
                  setState(() {
                    _ativo = value!;
                  });
                },
              ),
              Text(_dataUltCtrlDopp.toString()),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    child: const Text("Select a date",
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                  )),
              // DateTimeField(
              //   initialValue: _dataUltCtrlDopp,
              //   decoration:
              //       InputDecoration(labelText: 'Ultimo Controlo Anti-Dopping'),
              //   format: DateFormat('dd-MM-yyyy'),
              //   onShowPicker: (context, currentValue) async {
              //     final date = await showDatePicker(
              //         context: context,
              //         firstDate: DateTime(1900),
              //         initialDate: currentValue ?? DateTime.now(),
              //         lastDate: DateTime(2100));
              //     if (date != null) {
              //       return date;
              //     } else {
              //       return currentValue;
              //     }
              //   },
              //   onChanged: (value) {
              //     setState(() {
              //       _dataUltCtrlDopp = value;
              //     });
              //   },
              // ),
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                  widget.jogadorEdit.nome = _nome;
                  widget.jogadorEdit.idade = _idade;
                  widget.jogadorEdit.ativo = _ativo;
                  widget.jogadorEdit.dataUltCtrlDopp = _dataUltCtrlDopp;
                  objectbox.jogadorBox.put(widget.jogadorEdit);
                  // JogadorReg(jogadorReg: widget.jogadorEdit);
                  Navigator.pop(context);
                  // Navigator.pop(context);
                  // new JogadorReg(jogadorReg: widget.jogadorEdit);

                  // }
                },
                child: Text('Gravar'),
              ),
            ],
          ),
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
