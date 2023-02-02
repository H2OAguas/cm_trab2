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
    Competicao competicao5 = Competicao("Premier League", 2,
        idEquipaCasa: 25,
        idEquipaVisitante: 23,
        golosCasa: 3,
        golosVisitante: 2);
    Competicao competicao6 = Competicao("Premier League", 2,
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
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "Vitória SC",
        pontos: 3,
        jornada: 1);
    Classificacao jogo2 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "Gil Vicente FC",
        pontos: 6,
        jornada: 2);
    Classificacao jogo3 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "CD Tondela",
        pontos: 9,
        jornada: 3);
    Classificacao jogo4 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "Portimonense SC",
        pontos: 12,
        jornada: 4);
    Classificacao jogo5 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "FC Porto",
        pontos: 12,
        jornada: 5);
    Classificacao jogo6 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "SL Benfica",
        pontos: 15,
        jornada: 1);
    Classificacao jogo7 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "SC Braga",
        pontos: 6,
        jornada: 2);
    Classificacao jogo8 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "Sporting CP",
        pontos: 9,
        jornada: 3);
    Classificacao jogo9 = Classificacao(
        id: 0,
        liga: "Liga Portugal",
        nomeEquipa: "Farense",
        pontos: 9,
        jornada: 4);
    Classificacao jogo10 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Arsenal",
        pontos: 10,
        jornada: 5);
    Classificacao jogo11 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Brighton",
        pontos: 0,
        jornada: 1);
    Classificacao jogo12 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Manchester United",
        pontos: 1,
        jornada: 2);
    Classificacao jogo13 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Liverpool",
        pontos: 4,
        jornada: 3);
    Classificacao jogo14 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Chelsea",
        pontos: 7,
        jornada: 4);
    Classificacao jogo15 = Classificacao(
        id: 0,
        liga: "Premier League",
        nomeEquipa: "Tottenham Hotspur",
        pontos: 8,
        jornada: 5);

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
    Equipa equipa12 = Equipa("CD Tondela");
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
