import 'package:gestao_futebol/objectbox.g.dart';
import '../lib.dart';
import 'package:intl/intl.dart';
import '../models/hist_contrat.dart';
import '../models/equipa.dart';

class HistContratCard extends StatefulWidget {
  final HistContrat histContrat;

  const HistContratCard({Key? key, required this.histContrat})
      : super(key: key);

  @override
  State<HistContratCard> createState() => _HistContratCardState();
}

class _HistContratCardState extends State<HistContratCard> {
  @override
  Widget build(BuildContext context) {
    final equipaQuery = objectbox.equipaBox
        .query(Equipa_.id.equals(widget.histContrat.idEquipa))
        .build();
    Equipa? equipaResult = equipaQuery.findFirst();
    equipaQuery.close;
    return GestureDetector(
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
                            equipaResult!.nome.toString(),
                            style: const TextStyle(
                                fontSize: 15.0,
                                height: 1.0,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                  "Data inicial: : ${DateFormat('dd.MM.yyyy').format(widget.histContrat.dataInicio!)}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.fade)),
                              const Spacer(),
                              Text(
                                  "Data final: : ${DateFormat('dd.MM.yyyy').format(widget.histContrat.dataFinal!)}",
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
