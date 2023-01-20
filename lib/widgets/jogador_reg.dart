import 'package:intl/intl.dart';
import '../lib.dart';
import '../data/jogadores.dart';
import '../models/jogador.dart';

/// Styling for an event card. Includes the name, location and date.
/// Clicking a card navigates to a list of tasks related to event.

class JogadorReg extends StatefulWidget {
  final Jogador jogadorReg;

  const JogadorReg({Key? key, required this.jogadorReg}) : super(key: key);

  @override
  State<JogadorReg> createState() => _JogadorRegState();
}

class _JogadorRegState extends State<JogadorReg> {
  // final Jogador jogadorReg;

  // _JogadorRegState({Key key, @required this.jogadorReg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Nome: ${widget.jogadorReg.nome}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
            Text(
              "Idade: ${widget.jogadorReg.idade ?? 'N/A'}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
            Row(children: <Widget>[
              Text(
                "Ativo: ",
                style: const TextStyle(
                    fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
              ),
              Checkbox(value: widget.jogadorReg.ativo, onChanged: null
                  // {
                  //   // Handle the change event here
                  //   // You can update the jogador.ativo value and save it to the database
                  // },
                  ),
            ]),
            Text(
              "Data Ultimo Controlo Dooping: ${widget.jogadorReg.dataUltCtrlDopp != null ? DateFormat("dd-MM-yyyy").format(widget.jogadorReg.dataUltCtrlDopp!) : 'N/A'}",
              style: const TextStyle(
                  fontSize: 20.0, height: 1.0, overflow: TextOverflow.fade),
            ),
          ],
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
