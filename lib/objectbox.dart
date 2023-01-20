import 'package:flutter/material.dart';

import 'models/jogador.dart';
import 'models/competicao.dart';
import 'models/equipa.dart';
import 'objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  late final Store store;

  late final Box<Jogador> jogadorBox;
  late final Box<Competicao> competicaoBox;
  late final Box<Equipa> equipaBox;

  ObjectBox._create(this.store) {
    jogadorBox = Box<Jogador>(store);
    competicaoBox = Box<Competicao>(store);
    equipaBox = Box<Equipa>(store);

    if (jogadorBox.isEmpty()) {
      _putJogadorDemoData();
    }
    if (competicaoBox.isEmpty()) {
      _putCompeticaoDemoData();
    }
    if (equipaBox.isEmpty()) {
      _putEquipaDemoData();
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

    jogadorBox.putMany([jogador1, jogador2, jogador3]);
  }

  void _putCompeticaoDemoData() {
    Jogador jogador1 = Jogador(
        "Cristiano Ronaldo", "37", DateTime.utc(2021, 10, 12),
        ativo: true);
    Jogador jogador2 =
        Jogador("Diogo Costa", "23", DateTime.now(), ativo: true);
    Jogador jogador3 =
        Jogador("João Felix", "23", DateTime.utc(2021, 5, 12), ativo: true);

    jogadorBox.putMany([jogador1, jogador2, jogador3]);
  }

  void _putEquipaDemoData() {
    Jogador jogador1 = Jogador(
        "Cristiano Ronaldo", "37", DateTime.utc(2021, 10, 12),
        ativo: true);
    Jogador jogador2 =
        Jogador("Diogo Costa", "23", DateTime.now(), ativo: true);
    Jogador jogador3 =
        Jogador("João Felix", "23", DateTime.utc(2021, 5, 12), ativo: true);

    jogadorBox.putMany([jogador1, jogador2, jogador3]);
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
