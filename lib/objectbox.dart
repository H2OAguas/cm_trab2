import 'package:flutter/material.dart';
import 'package:gestao_futebol/models/hist_contrat.dart';
import 'models/jogador.dart';
import 'models/competicao.dart';
import 'models/classificacao.dart';
import 'models/equipa.dart';
import 'objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  late final Store store;
  // late final Admin _admin;

  late final Box<Jogador> jogadorBox;
  late final Box<Competicao> competicaoBox;
  late final Box<Equipa> equipaBox;
  late final Box<HistContrat> histContratBox;
  late final Box<Classificacao> classificacaoBox;

  ObjectBox._create(this.store) {
    // if (Admin.isAvailable()) {
    //   // Keep a reference until no longer needed or manually closed.
    //   _admin = Admin(store);
    // }
    jogadorBox = Box<Jogador>(store);
    competicaoBox = Box<Competicao>(store);
    equipaBox = Box<Equipa>(store);
    classificacaoBox = Box<Classificacao>(store);
    histContratBox = Box<HistContrat>(store);
    //Como não esta implementado alterações aos contratos, opta-se por, sempre que carrega a app, eliminar a tabela e recria-la.
    histContratBox.removeAll();
    classificacaoBox.removeAll();

    //Para facilitar a introdução de contratos em contexto de demonstração

    // HistContrat histContrat7 = HistContrat(
    //     idJogador: 4,
    //     idEquipa: 7,
    //     dataInicio: DateTime.utc(2022, 5, 16),
    //     dataFinal: DateTime.utc(2024, 5, 16));
    // histContratBox.putMany([histContrat7]);

    if (jogadorBox.isEmpty()) {
      _putJogadorDemoData();
    }
    if (competicaoBox.isEmpty()) {
      _putCompeticaoDemoData();
    }
    if (equipaBox.isEmpty()) {
      _putEquipaDemoData();
    }
    if (histContratBox.isEmpty()) {
      _putHistContratDemoData();
    }
    if (classificacaoBox.isEmpty()) {
      _putClassificacaoDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void _putJogadorDemoData() {
    Jogador jogador1 = Jogador(
        "Cristiano Ronaldo", "37", DateTime.utc(2021, 10, 12),
        ativo: true);
    Jogador jogador2 =
        Jogador("Diogo Costa", "23", DateTime.now(), ativo: true);
    Jogador jogador3 =
        Jogador("João Felix", "23", DateTime.utc(2021, 5, 12), ativo: true);
    Jogador jogador4 =
        Jogador("Bernardo Silva", "26", DateTime.utc(2021, 9, 15));
    Jogador jogador5 = Jogador("João Cancelo", "27", DateTime.utc(2021, 8, 20));
    Jogador jogador6 = Jogador("Rúben Dias", "23", DateTime.utc(2021, 7, 25));
    Jogador jogador7 =
        Jogador("Bruno Fernandes", "26", DateTime.utc(2021, 6, 30));
    Jogador jogador8 = Jogador("Diogo Jota", "24", DateTime.utc(2021, 5, 5));
    Jogador jogador9 = Jogador("Danilo", "28", DateTime.utc(2021, 4, 10));
    Jogador jogador10 = Jogador("Rúben Neves", "24", DateTime.utc(2021, 3, 15));
    Jogador jogador11 =
        Jogador("Rúben Semedo", "26", DateTime.utc(2021, 2, 20));
    Jogador jogador12 = Jogador("André Silva", "25", DateTime.utc(2021, 1, 25));
    jogadorBox.putMany([
      jogador1,
      jogador2,
      jogador3,
      jogador4,
      jogador5,
      jogador6,
      jogador7,
      jogador8,
      jogador9,
      jogador10,
      jogador11,
      jogador12
    ]);
  }

  void _putCompeticaoDemoData() {
    Competicao competicao1 = Competicao("Taça de Portugal", 1,
        idEquipaCasa: 1, idEquipaVisitante: 2, golosCasa: 1, golosVisitante: 2);
    Competicao competicao2 = Competicao("La Liga", 2,
        idEquipaCasa: 1, idEquipaVisitante: 3, golosCasa: 3, golosVisitante: 2);
    Competicao competicao3 = Competicao("Champions League", 2,
        idEquipaCasa: 1, idEquipaVisitante: 3, golosCasa: 3, golosVisitante: 2);
    Competicao competicao4 = Competicao("Liga Portuguesa", 2,
        idEquipaCasa: 1, idEquipaVisitante: 3, golosCasa: 3, golosVisitante: 2);
    Competicao competicao5 = Competicao("liga portugal 2", 2,
        idEquipaCasa: 25,
        idEquipaVisitante: 23,
        golosCasa: 3,
        golosVisitante: 2);
    Competicao competicao6 = Competicao("liga portugal 2", 2,
        idEquipaCasa: 21,
        idEquipaVisitante: 16,
        golosCasa: 3,
        golosVisitante: 4);

    competicaoBox.putMany([
      competicao1,
      competicao2,
      competicao3,
      competicao4,
      competicao5,
      competicao6
    ]);
  }

  void _putClassificacaoDemoData() {
    Classificacao jogo1 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Vitória SC",
        pontos: 3,
        jornada: 1);
    Classificacao jogo2 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Gil Vicente FC",
        pontos: 3,
        jornada: 1);
    Classificacao jogo3 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Marítimo M.",
        pontos: 0,
        jornada: 1);
    Classificacao jogo4 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Portimonense SC",
        pontos: 0,
        jornada: 1);
    Classificacao jogo5 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "FC Porto",
        pontos: 3,
        jornada: 1);
    Classificacao jogo6 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SL Benfica",
        pontos: 3,
        jornada: 1);
    Classificacao jogo7 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SC Braga",
        pontos: 1,
        jornada: 1);
    Classificacao jogo8 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Sporting CP",
        pontos: 1,
        jornada: 1);
    Classificacao jogo9 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Vitória SC",
        pontos: 6,
        jornada: 2);
    Classificacao jogo10 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Gil Vicente FC",
        pontos: 3,
        jornada: 2);
    Classificacao jogo11 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Marítimo M.",
        pontos: 0,
        jornada: 2);
    Classificacao jogo12 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Portimonense SC",
        pontos: 3,
        jornada: 2);
    Classificacao jogo13 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "FC Porto",
        pontos: 6,
        jornada: 2);
    Classificacao jogo14 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SL Benfica",
        pontos: 6,
        jornada: 2);
    Classificacao jogo15 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SC Braga",
        pontos: 4,
        jornada: 2);
    Classificacao jogo16 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Sporting CP",
        pontos: 4,
        jornada: 2);
    Classificacao jogo17 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Vitória SC",
        pontos: 6,
        jornada: 3);
    Classificacao jogo18 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Gil Vicente FC",
        pontos: 4,
        jornada: 3);
    Classificacao jogo19 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Marítimo M.",
        pontos: 0,
        jornada: 3);
    Classificacao jogo20 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Portimonense SC",
        pontos: 6,
        jornada: 3);
    Classificacao jogo21 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "FC Porto",
        pontos: 9,
        jornada: 3);
    Classificacao jogo22 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SL Benfica",
        pontos: 9,
        jornada: 3);
    Classificacao jogo23 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SC Braga",
        pontos: 7,
        jornada: 3);
    Classificacao jogo24 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Sporting CP",
        pontos: 4,
        jornada: 3);
    Classificacao jogo25 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Vitória SC",
        pontos: 6,
        jornada: 4);
    Classificacao jogo26 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Gil Vicente FC",
        pontos: 5,
        jornada: 4);
    Classificacao jogo27 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Marítimo M.",
        pontos: 0,
        jornada: 4);
    Classificacao jogo28 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Portimonense SC",
        pontos: 9,
        jornada: 4);
    Classificacao jogo29 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "FC Porto",
        pontos: 9,
        jornada: 4);
    Classificacao jogo30 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SL Benfica",
        pontos: 12,
        jornada: 4);
    Classificacao jogo31 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SC Braga",
        pontos: 10,
        jornada: 4);
    Classificacao jogo32 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Sporting CP",
        pontos: 4,
        jornada: 4);
    Classificacao jogo33 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Vitória SC",
        pontos: 6,
        jornada: 5);
    Classificacao jogo34 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Gil Vicente FC",
        pontos: 5,
        jornada: 5);
    Classificacao jogo35 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Marítimo M.",
        pontos: 0,
        jornada: 5);
    Classificacao jogo36 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Portimonense SC",
        pontos: 12,
        jornada: 5);
    Classificacao jogo37 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "FC Porto",
        pontos: 12,
        jornada: 5);
    Classificacao jogo38 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SL Benfica",
        pontos: 15,
        jornada: 5);
    Classificacao jogo39 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "SC Braga",
        pontos: 13,
        jornada: 5);
    Classificacao jogo40 = Classificacao(
        liga: "liga portugal bwin",
        nomeEquipa: "Sporting CP",
        pontos: 7,
        jornada: 5);
    Classificacao jogo41 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Académico de Viseu FC",
        pontos: 1,
        jornada: 1);
    Classificacao jogo42 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Estrela Amadora",
        pontos: 1,
        jornada: 1);
    Classificacao jogo43 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: " SC Covilhã",
        pontos: 3,
        jornada: 1);
    Classificacao jogo44 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "S.C. Farense",
        pontos: 3,
        jornada: 1);
    Classificacao jogo45 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "FC Porto B",
        pontos: 0,
        jornada: 1);
    Classificacao jogo46 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "SL Benfica B",
        pontos: 1,
        jornada: 1);
    Classificacao jogo47 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "Nacional", pontos: 0, jornada: 1);
    Classificacao jogo48 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "B SAD", pontos: 0, jornada: 1);
    Classificacao jogo49 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Académico de Viseu FC",
        pontos: 1,
        jornada: 2);
    Classificacao jogo50 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Estrela Amadora",
        pontos: 2,
        jornada: 2);
    Classificacao jogo51 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: " SC Covilhã",
        pontos: 3,
        jornada: 2);
    Classificacao jogo52 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "S.C. Farense",
        pontos: 4,
        jornada: 2);
    Classificacao jogo53 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "FC Porto B",
        pontos: 3,
        jornada: 2);
    Classificacao jogo54 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "SL Benfica B",
        pontos: 2,
        jornada: 2);
    Classificacao jogo55 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "Nacional", pontos: 3, jornada: 2);
    Classificacao jogo56 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "B SAD", pontos: 0, jornada: 2);
    Classificacao jogo57 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Académico de Viseu FC",
        pontos: 2,
        jornada: 3);
    Classificacao jogo58 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Estrela Amadora",
        pontos: 5,
        jornada: 3);
    Classificacao jogo59 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: " SC Covilhã",
        pontos: 4,
        jornada: 3);
    Classificacao jogo60 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "S.C. Farense",
        pontos: 5,
        jornada: 3);
    Classificacao jogo61 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "FC Porto B",
        pontos: 6,
        jornada: 3);
    Classificacao jogo62 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "SL Benfica B",
        pontos: 2,
        jornada: 3);
    Classificacao jogo63 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "Nacional", pontos: 3, jornada: 3);
    Classificacao jogo64 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "B SAD", pontos: 1, jornada: 3);
    Classificacao jogo65 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Académico de Viseu FC",
        pontos: 3,
        jornada: 4);
    Classificacao jogo66 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Estrela Amadora",
        pontos: 6,
        jornada: 4);
    Classificacao jogo67 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: " SC Covilhã",
        pontos: 4,
        jornada: 4);
    Classificacao jogo68 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "S.C. Farense",
        pontos: 8,
        jornada: 4);
    Classificacao jogo69 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "FC Porto B",
        pontos: 7,
        jornada: 4);
    Classificacao jogo70 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "SL Benfica B",
        pontos: 3,
        jornada: 4);
    Classificacao jogo71 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "Nacional", pontos: 3, jornada: 4);
    Classificacao jogo72 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "B SAD", pontos: 1, jornada: 4);
    Classificacao jogo73 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Académico de Viseu FC",
        pontos: 3,
        jornada: 5);
    Classificacao jogo74 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "Estrela Amadora",
        pontos: 7,
        jornada: 5);
    Classificacao jogo75 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: " SC Covilhã",
        pontos: 5,
        jornada: 5);
    Classificacao jogo76 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "S.C. Farense",
        pontos: 6,
        jornada: 5);
    Classificacao jogo77 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "FC Porto B",
        pontos: 7,
        jornada: 5);
    Classificacao jogo78 = Classificacao(
        liga: "liga portugal 2",
        nomeEquipa: "SL Benfica B",
        pontos: 6,
        jornada: 5);
    Classificacao jogo79 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "Nacional", pontos: 3, jornada: 5);
    Classificacao jogo80 = Classificacao(
        liga: "liga portugal 2", nomeEquipa: "B SAD", pontos: 4, jornada: 5);

    classificacaoBox.putMany([
      jogo1,
      jogo2,
      jogo3,
      jogo4,
      jogo5,
      jogo6,
      jogo7,
      jogo8,
      jogo9,
      jogo10,
      jogo11,
      jogo12,
      jogo13,
      jogo14,
      jogo15,
      jogo16,
      jogo17,
      jogo18,
      jogo19,
      jogo20,
      jogo21,
      jogo22,
      jogo23,
      jogo24,
      jogo25,
      jogo26,
      jogo27,
      jogo28,
      jogo29,
      jogo30,
      jogo31,
      jogo32,
      jogo33,
      jogo34,
      jogo35,
      jogo36,
      jogo37,
      jogo38,
      jogo39,
      jogo40,
      jogo41,
      jogo42,
      jogo43,
      jogo44,
      jogo45,
      jogo46,
      jogo47,
      jogo48,
      jogo49,
      jogo50,
      jogo51,
      jogo52,
      jogo53,
      jogo54,
      jogo55,
      jogo56,
      jogo57,
      jogo58,
      jogo59,
      jogo60,
      jogo61,
      jogo62,
      jogo63,
      jogo64,
      jogo65,
      jogo66,
      jogo67,
      jogo68,
      jogo69,
      jogo70,
      jogo71,
      jogo72,
      jogo73,
      jogo74,
      jogo75,
      jogo76,
      jogo77,
      jogo78,
      jogo79,
      jogo80
    ]);
  }

  void _putEquipaDemoData() {
    Equipa equipa1 = Equipa("Sporting CP");
    Equipa equipa2 = Equipa("FC Porto");
    Equipa equipa3 = Equipa("SL Benfica");
    Equipa equipa4 = Equipa("SC Braga");
    Equipa equipa5 = Equipa("Vitória SC");
    Equipa equipa6 = Equipa("Rio Ave FC");
    Equipa equipa7 = Equipa("Boavista FC");
    Equipa equipa8 = Equipa("FC Famalicão");
    Equipa equipa9 = Equipa("Gil Vicente FC");
    Equipa equipa10 = Equipa("Moreirense FC");
    Equipa equipa11 = Equipa("CD Santa Clara");
    Equipa equipa12 = Equipa("Marítimo M.");
    Equipa equipa13 = Equipa("CS Marítimo");
    Equipa equipa14 = Equipa("Portimonense SC");
    Equipa equipa15 = Equipa("Farense");
    Equipa equipa16 = Equipa("Manchester United");
    Equipa equipa17 = Equipa("Barcelona");
    Equipa equipa18 = Equipa("Paris Saint-Germain");
    Equipa equipa19 = Equipa("Bayern Munich");
    Equipa equipa20 = Equipa("Juventus");
    Equipa equipa21 = Equipa("Liverpool");
    Equipa equipa22 = Equipa("Real Madrid");
    Equipa equipa23 = Equipa("Chelsea");
    Equipa equipa24 = Equipa("Atletico Madrid");
    Equipa equipa25 = Equipa("Tottenham Hotspur");
    Equipa equipa26 = Equipa("Arsenal");
    Equipa equipa27 = Equipa("Brighton");

    equipaBox.putMany([
      equipa1,
      equipa2,
      equipa3,
      equipa4,
      equipa5,
      equipa6,
      equipa7,
      equipa8,
      equipa9,
      equipa10,
      equipa11,
      equipa12,
      equipa13,
      equipa14,
      equipa15,
      equipa16,
      equipa17,
      equipa18,
      equipa19,
      equipa20,
      equipa21,
      equipa22,
      equipa23,
      equipa24,
      equipa25,
      equipa26,
      equipa27
    ]);
  }

  void _putHistContratDemoData() {
    HistContrat histContrat1 = HistContrat(
        idJogador: 1,
        idEquipa: 1,
        dataInicio: DateTime.now(),
        dataFinal: DateTime.now());
    HistContrat histContrat2 = HistContrat(
        idJogador: 2,
        idEquipa: 3,
        dataInicio: DateTime.now(),
        dataFinal: DateTime.now());
    HistContrat histContrat3 = HistContrat(
        idJogador: 1,
        idEquipa: 7,
        dataInicio: DateTime.utc(2015, 8, 15),
        dataFinal: DateTime.utc(2017, 8, 15));
    HistContrat histContrat4 = HistContrat(
        idJogador: 1,
        idEquipa: 9,
        dataInicio: DateTime.utc(2017, 8, 16),
        dataFinal: DateTime.utc(2018, 8, 16));
    HistContrat histContrat5 = HistContrat(
        idJogador: 12,
        idEquipa: 4,
        dataInicio: DateTime.utc(2022, 5, 16),
        dataFinal: DateTime.utc(2023, 5, 16));
    HistContrat histContrat6 = HistContrat(
        idJogador: 4,
        idEquipa: 7,
        dataInicio: DateTime.utc(2022, 5, 16),
        dataFinal: DateTime.utc(2024, 5, 16));
    histContratBox.putMany([
      histContrat1,
      histContrat2,
      histContrat3,
      histContrat4,
      histContrat5,
      histContrat6
    ]);
  }
  // void addJogador(String taskText, Owner owner, Event event) {
  //   Task newTask = Task(taskText);
  //   newTask.owner.target = owner;

  //   Event updatedEvent = event;
  //   updatedEvent.tasks.add(newTask);
  //   newTask.event.target = updatedEvent;

  //   eventBox.put(updatedEvent);

  //   debugPrint(
  //       "Added Task: ${newTask.text} assigned to ${newTask.owner.target?.name} in event: ${updatedEvent.name}");
  // }

  // void addEvent(String name, DateTime date, String location) {
  //   Event newEvent = Event(name, date: date, location: location);

  //   eventBox.put(newEvent);
  //   debugPrint("Added Event: ${newEvent.name}");
  // }

  // int addOwner(String newOwner) {
  //   Owner ownerToAdd = Owner(newOwner);
  //   int newObjectId = ownerBox.put(ownerToAdd);

  //   return newObjectId;
  // }

  // Stream<List<Event>> getEvents() {
  //   // Query for all events ordered by date.
  //   // https://docs.objectbox.io/queries
  //   final builder = eventBox.query()..order(Event_.date);
  //   return builder.watch(triggerImmediately: true).map((query) => query.find());
  // }

  // Stream<List<Task>> getTasksOfEvent(int eventId) {
  //   final builder = taskBox.query()..order(Task_.id, flags: Order.descending);
  //   builder.link(Task_.event, Event_.id.equals(eventId));
  //   return builder.watch(triggerImmediately: true).map((query) => query.find());
  // }
}
