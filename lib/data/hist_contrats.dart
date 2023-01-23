import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/hist_contrat.dart';

class HistContrats {
  final List<HistContrat> _histContrats = [];

  final now = DateTime.now();

  Stream<List<HistContrat>> getHistContrats() {
    //   // Query para todos jogadores que tenham feito o control antidopping há mais de 6 meses
    //   // https://docs.objectbox.io/queries
    //   var endDate = DateTime(now.year, now.month, now.day - 10);
    //   // final builder = objectbox.jogadorBox.query(Jogador_.dataUltCtrlDopp.between(
    //   //     DateTime.utc(1900).millisecondsSinceEpoch,
    //   //     endDate.millisecondsSinceEpoch))
    //   //   ..order(Jogador_.dataUltCtrlDopp);
    final builder = objectbox.histContratBox.query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<HistContrat>> getHistContratsId(int id) {
    final builder = objectbox.histContratBox.query(HistContrat_.id.equals(id));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
