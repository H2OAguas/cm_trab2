import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/equipa.dart';

class Equipas {
  final List<Equipa> _equipas = [];

  final now = DateTime.now();

  Stream<List<Equipa>> getEquipas() {
    final builder = objectbox.equipaBox.query()..order(Equipa_.nome);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
