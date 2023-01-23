import '../lib.dart';
import 'package:intl/intl.dart';

import '../data/equipas.dart';
import '../models/equipa.dart';
import './jogador_reg.dart';

class EquipaCard extends StatefulWidget {
  final Equipa equipa;

  const EquipaCard({Key? key, required this.equipa}) : super(key: key);

  @override
  State<EquipaCard> createState() => _EquipaCardState();
}

class _EquipaCardState extends State<EquipaCard> {
//     @override
//   void initState() {
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => EquiReg(jogadorReg: widget.jogador)));
      // },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 168, 168, 168),
                    blurRadius: 5,
                    offset: Offset(1, 2),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            widget.equipa.nome,
                            style: const TextStyle(
                                fontSize: 15.0,
                                height: 1.0,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Row(
                        //     children: [
                        //       Text("Idade: ${widget.jogador.idade}",
                        //           style: const TextStyle(
                        //               fontSize: 15.0,
                        //               height: 1.0,
                        //               overflow: TextOverflow.fade)),
                        //       const Spacer(),
                        //       Text(
                        //           "Ult Ctrl AntiDopping: ${DateFormat('dd.MM.yyyy').format(widget.jogador.dataUltCtrlDopp!)}",
                        //           style: const TextStyle(
                        //               fontSize: 15.0,
                        //               height: 1.0,
                        //               overflow: TextOverflow.fade))
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
