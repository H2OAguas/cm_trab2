import 'package:intl/intl.dart';
import '../lib.dart';
import '../data/jogadores.dart';
import '../models/jogador.dart';
// import './jogador_add.dart';

/// Styling for an event card. Includes the name, location and date.
/// Clicking a card navigates to a list of tasks related to event.

class JogadorEdit extends StatefulWidget {
  final Jogador jogadorEdit;

  const JogadorEdit({Key? key, required this.jogadorEdit}) : super(key: key);

  @override
  State<JogadorEdit> createState() => _JogadorEditState();
}

class _JogadorEditState extends State<JogadorEdit> {
  final eventNameController = TextEditingController();
  final eventLocationController = TextEditingController();
  DateTime? currentDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste Edit"),
      ),
      body: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: eventNameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: eventLocationController,
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  currentDate != null
                      ? "Date: ${DateFormat.yMd().format(currentDate!)}"
                      : "Date: Not Selected",
                ),
              ),
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
                        // setState(() {
                        //   currentDate = date;
                        // });
                      });
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Spacer(),
              ElevatedButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // createEvent();
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ]),
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
