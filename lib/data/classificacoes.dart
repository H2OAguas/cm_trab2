import 'package:gestao_futebol/models/classificacao.dart';
import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/classificacao.dart';

class Classificacoes {
  Stream<List<Classificacao>> getClassificacoesLP() {
    final builder = objectbox.classificacaoBox
        .query(Classificacao_.liga.equals("Liga Portugal"))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesPL() {
    final builder = objectbox.classificacaoBox
        .query(Classificacao_.liga.equals("Premier League"))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
