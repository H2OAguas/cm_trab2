import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/competicao.dart';

class Competicoes {
  final List<Competicao> _competicoes = [];

  Stream<List<Competicao>> getCompeticoes() {
    final builder = objectbox.competicaoBox.query()
      ..order(Competicao_.nJornada);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
