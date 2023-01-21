import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/equipa.dart';

class Jogadores {
  final List<Equipa> _equipas = [];

  final now = DateTime.now();

  Stream<List<Equipa>> getEquipas() {
    //   // Query para todos jogadores que tenham feito o control antidopping há mais de 6 meses
    //   // https://docs.objectbox.io/queries
    //   var endDate = DateTime(now.year, now.month, now.day - 10);
    //   // final builder = objectbox.jogadorBox.query(Jogador_.dataUltCtrlDopp.between(
    //   //     DateTime.utc(1900).millisecondsSinceEpoch,
    //   //     endDate.millisecondsSinceEpoch))
    //   //   ..order(Jogador_.dataUltCtrlDopp);
    final builder = objectbox.equipaBox.query()..order(Equipa_.nome);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
