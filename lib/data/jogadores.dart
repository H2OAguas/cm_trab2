import 'package:event_manager_objectbox/main.dart';
import 'package:event_manager_objectbox/objectbox.g.dart';
import '../models/jogador.dart';

class Jogadores {
  final List<Jogador> _jogadores = [];

  final now = DateTime.now();

  Stream<List<Jogador>> getJogadoresCtrlDopp() {
    // Query para todos jogadores que tenham feito o control antidopping há mais de 6 meses
    // https://docs.objectbox.io/queries
    var endDate = DateTime(now.year, now.month, now.day - 10);
    // final builder = objectbox.jogadorBox.query(Jogador_.dataUltCtrlDopp.between(
    //     DateTime.utc(1900).millisecondsSinceEpoch,
    //     endDate.millisecondsSinceEpoch))
    //   ..order(Jogador_.dataUltCtrlDopp);
    final builder = objectbox.jogadorBox.query()
      ..order(Jogador_.dataUltCtrlDopp);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
