import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/jogadores.dart';
import '../models/jogador.dart';
import './jogador_reg.dart';

class JogadorCard extends StatefulWidget {
  final Jogador jogador;

  const JogadorCard({Key? key, required this.jogador}) : super(key: key);

  @override
  State<JogadorCard> createState() => _JogadorCardState();
}

class _JogadorCardState extends State<JogadorCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JogadorReg(jogadorReg: widget.jogador)));
      },
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
                            widget.jogador.nome,
                            style: const TextStyle(
                                fontSize: 25.0,
                                height: 1.0,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("Idade: ${widget.jogador.idade}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.fade)),
                              const Spacer(),
                              Text(
                                  "Ult Ctrl AntiDopping: ${DateFormat('dd.MM.yyyy').format(widget.jogador.dataUltCtrlDopp!)}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.fade))
                            ],
                          ),
                        ),
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
