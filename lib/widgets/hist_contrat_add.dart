import 'package:gestao_futebol/models/jogador.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import 'package:intl/intl.dart';
import '../lib.dart';
import '../models/hist_contrat.dart';
import './jogador_edit.dart';
import './hist_contrat_list.dart';
import '../models/equipa.dart';
import '../data/equipas.dart';

class HistContratAdd extends StatefulWidget {
  // final int idJogador;
  final Jogador histContratJogador;
  // const HistContratAdd({Key? key, required this.idJogador}) : super(key: key);
  const HistContratAdd({Key? key, required this.histContratJogador})
      : super(key: key);

  @override
  State<HistContratAdd> createState() => _HistContratAddState();
}

class _HistContratAddState extends State<HistContratAdd> {
  // final _formKey = GlobalKey<FormState>();
  List<Equipa> equipas = objectbox.equipaBox.getAll();
  final equipaInputController = TextEditingController();
  final dataInicioInputController = TextEditingController();
  final dataFinalInputController = TextEditingController();
  late Equipa currentEquipa;
  late DateTime? _dataInicio = DateTime.now();
  late DateTime? _dataFinal = DateTime.now();

  void updateEquipa(int changedEquipaId) {
    Equipa newCurrentEquipa;

    newCurrentEquipa = objectbox.equipaBox.get(changedEquipaId)!;

    setState(() {
      currentEquipa = newCurrentEquipa;
    });
  }

  @override
  void initState() {
    currentEquipa = equipas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Inserir contrato para o \n${widget.histContratJogador.nome}"),
      ),
      key: UniqueKey(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Row(
            children: [
              const Text("Equipa:", style: TextStyle(fontSize: 17)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<int>(
                    value: currentEquipa.id,
                    items: equipas
                        .map((element) => DropdownMenuItem(
                            value: element.id,
                            child: Text(element.nome,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    height: 1.0,
                                    overflow: TextOverflow.fade))))
                        .toList(),
                    underline: Container(
                      height: 1.5,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (value) => {updateEquipa(value!)}),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Data Inicial: ${DateFormat("dd-MM-yyyy").format(_dataInicio!)}",
                ),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    child: const Text("Selecione data",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2050))
                          .then((date) {
                        setState(() {
                          if (date != null) {
                            _dataInicio = date;
                          }
                        });
                      });
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Data Fim: ${DateFormat("dd-MM-yyyy").format(_dataFinal!)}",
                ),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    child: const Text("Selecione data",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2050))
                          .then((date) {
                        if (date != null) {
                          _dataFinal = date;
                        }
                        setState(() {});
                      });
                    },
                  )),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final contratoAdd = HistContrat(
                idJogador: widget.histContratJogador.id,
                idEquipa: currentEquipa.id,
                dataInicio: _dataInicio,
                dataFinal: _dataFinal);
            objectbox.histContratBox.put(contratoAdd);
            Navigator.pop(context);
          },
          child: Text('Gravar'),
        ),
      ]),
    );
  }
}


// Form(
        
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(children: <Widget>[
//             Column(children: <Widget>[
//               ValueListenableBuilder(valueListenable: valueListenable, builder: builder)

//               // TextFormField(
//               //   style: const TextStyle(fontSize: 22),
//               //   // initialValue: _nome,
//               //   decoration: const InputDecoration(
//               //       labelText: 'Nome', labelStyle: TextStyle(fontSize: 20)),
//               //   onChanged: (value) => _nome = value,
//               //   // _nome = value!,
//               // ),

//               TextFormField(
//                 style: const TextStyle(fontSize: 22),
//                 // initialValue: _idade,
//                 decoration: const InputDecoration(
//                     labelText: 'Idade', labelStyle: TextStyle(fontSize: 20)),
//                 onChanged: (value) => _idade = value,
//               ),
//             ]),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 CheckboxListTile(
//                   // controlAffinity: ListTileControlAffinity.platform,
//                   value: true,
//                   activeColor: Colors.green,
//                   title: const Text(
//                     'Ativo',
//                     // textAlign: TextAlign.right,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         height: 1.0,
//                         overflow: TextOverflow.fade),
//                     textAlign: TextAlign.left,
//                   ),
//                   onChanged: (value) {
//                     setState(() {
//                       _ativo = value!;
//                     });
//                   },
//                 ),
//                 Text(
//                   "Último control Anti Dopping: ${DateFormat('dd.MM.yyyy').format(_dataUltCtrlDopp!)}",
//                   style: const TextStyle(
//                       fontSize: 18.0, height: 1.0, overflow: TextOverflow.fade),
//                 ),
//                 // const Spacer(),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       child: const Text(
//                         "Alterar data",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                       onPressed: () {
//                         showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime(2010),
//                                 lastDate: DateTime(2050))
//                             .then((date) {
//                           if (date != null) {
//                             _dataUltCtrlDopp = date;
//                           }
//                           setState(() {});
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 // const Spacer(),
//                 ElevatedButton(
//                   onPressed: () {
//                     // final jogadorAdd =
//                     //     Jogador(_nome, _idade, _dataUltCtrlDopp, ativo: _ativo);
//                     // objectbox.jogadorBox.put(jogadorAdd);
//                     Navigator.pop(context);
//                   },
//                   child: Text('Gravar'),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//       ),