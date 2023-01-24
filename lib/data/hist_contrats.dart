import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/jogador.dart';
import '../models/hist_contrat.dart';

class HistContrats {
  // final List<HistContrat> _histContrats = [];
  // List<HistContrat> get list => _histContrats;

  final _histContrats = objectbox.histContratBox.getAll();
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
    final builder = objectbox.histContratBox
        .query(HistContrat_.idJogador.equals(id))
        .order(HistContrat_.dataFinal, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Jogador>> getHistContratExpering() {
    var queryDate = DateTime(
        DateTime.now().year, DateTime.now().month + 6, DateTime.now().day);
    // return _histContrats.getHistContrats().map((histContrats) {
    //   // filter histContrats by year of dataFinal
    final filteredHistContrats = _histContrats.where((histContrat) =>
        histContrat.dataFinal != null &&
        histContrat.dataFinal!.compareTo(queryDate) < 0);
    // .toList();
    final filteredJogadorIds = filteredHistContrats
        .map((histContrat) => histContrat.idJogador)
        .toList();
    final filteredJogadores =
        objectbox.jogadorBox.query(Jogador_.id.oneOf(filteredJogadorIds));
    return filteredJogadores
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }
// Stream<List<Jogador>> getHistContratsRenovacao() {
//   final HistContrats _histContrats = HistContrats();
//   var queryDate = DateTime(DateTime.now().year,DateTime.now().month + 6,DateTime.now().day);
//     return _histContrats.getHistContrats().map((histContrats) {
//       // filter histContrats by year of dataFinal
//       final filteredHistContrats = histContrats
//           .where((histContrat) =>
//               histContrat.dataFinal != null &&
//               histContrat.dataFinal!.compareTo(queryDate) < 0)
//           .toList();

//       // map filtered histContrats to jogadores
//       return filteredHistContrats
//           .map((histContrat) => Jogador(histContrat.idJogador))
//           .toList();
//     });
//   }

  // Stream<List<HistContrat>> getHistContratsRenovacao() {
  //   // Query que retorna tos os contratos que expiram há pelo menos 6 meses
  //   var endDate = DateTime(now.year, now.month + 6, now.day);
  //   final builder = objectbox.histContratBox.query(HistContrat_.dataFinal
  //       .between(DateTime.utc(1900).millisecondsSinceEpoch,
  //           endDate.millisecondsSinceEpoch));
  //   // ..order(HistContrat_.dataUltCtrlDopp);
  //   // final builder = objectbox.histContratBox.query();
  //   return builder.watch(triggerImmediately: true).map((query) => query.find());
  // }

}
