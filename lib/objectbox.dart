import 'package:flutter/material.dart';
import 'package:gestao_futebol/models/hist_contrat.dart';

import 'models/jogador.dart';
import 'models/competicao.dart';
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

  ObjectBox._create(this.store) {
    // if (Admin.isAvailable()) {
    //   // Keep a reference until no longer needed or manually closed.
    //   _admin = Admin(store);
    // }
    jogadorBox = Box<Jogador>(store);
    competicaoBox = Box<Competicao>(store);
    equipaBox = Box<Equipa>(store);
    histContratBox = Box<HistContrat>(store);
    //Como não esta implementado alterações aos contratos, opta-se por, sempre que carrega a app, eliminar a tabela e recria-la.
    histContratBox.removeAll();

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
    Competicao competicao1 = Competicao("1", 1,
        idEquipaCasa: 1, idEquipaVisitante: 1, golosCasa: 1, golosVisitante: 2);
    Competicao competicao2 = Competicao("X", 2,
        idEquipaCasa: 1, idEquipaVisitante: 3, golosCasa: 3, golosVisitante: 2);

    competicaoBox.putMany([competicao1, competicao2]);
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
      equipa25
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
