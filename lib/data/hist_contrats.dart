import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/jogador.dart';
import '../models/hist_contrat.dart';

class HistContrats {
  final _histContrats = objectbox.histContratBox.getAll();
  final now = DateTime.now();

  Stream<List<HistContrat>> getHistContrats() {
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

  String getHistContratsNdias(int id) {
    List<HistContrat> lstHistContract = objectbox.histContratBox
        .query(HistContrat_.idJogador.equals(id))
        .order(HistContrat_.dataFinal, flags: Order.descending)
        .build()
        .find();
    if (lstHistContract.isEmpty) {
      return "Sem contrato";
    } else {
      return (DateTime.now()
          .difference(lstHistContract.first.dataInicio!)
          .inDays
          .toString());
    }
    // final builder = objectbox.histContratBox
    //     .query(HistContrat_.idJogador.equals(id))
    //     .order(HistContrat_.dataFinal, flags: Order.descending);
    // return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
