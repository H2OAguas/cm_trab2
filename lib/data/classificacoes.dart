import 'package:gestao_futebol/models/classificacao.dart';
import '../lib.dart';
import 'package:gestao_futebol/objectbox.g.dart';
import '../models/classificacao.dart';

class Classificacoes {
  // metodos das jornadas disponíveis para a liga BWIN
  Stream<List<Classificacao>> getClassificacoesLPB1() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(1)
        .and(Classificacao_.liga.equals("liga portugal bwin")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLPB2() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(2)
        .and(Classificacao_.liga.equals("liga portugal bwin")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLPB3() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(3)
        .and(Classificacao_.liga.equals("liga portugal bwin")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLPB4() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(4)
        .and(Classificacao_.liga.equals("liga portugal bwin")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLPB5() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(5)
        .and(Classificacao_.liga.equals("liga portugal bwin")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  // metodos das jornadas disponíveis para a liga portugal 2
  Stream<List<Classificacao>> getClassificacoesLP1() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(1)
        .and(Classificacao_.liga.equals("liga portugal 2")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLP2() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(2)
        .and(Classificacao_.liga.equals("liga portugal 2")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLP3() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(3)
        .and(Classificacao_.liga.equals("liga portugal 2")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLP4() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(4)
        .and(Classificacao_.liga.equals("liga portugal 2")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<Classificacao>> getClassificacoesLP5() {
    final builder = objectbox.classificacaoBox.query(Classificacao_.jornada
        .equals(5)
        .and(Classificacao_.liga.equals("liga portugal 2")))
      ..order(Classificacao_.pontos, flags: Order.descending);
    ;
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
