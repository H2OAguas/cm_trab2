import 'package:objectbox/objectbox.dart';
// import 'package:event_manager_objectbox/objectbox.g.dart';

@Entity()
class Classificacao {
  @Id()
  int id;
  String liga;
  String nomeEquipa;
  int pontos;
  int jornada;

  Classificacao({
    this.id = 0,
    required this.liga,
    required this.nomeEquipa,
    this.pontos = 0,
    this.jornada = 0,
  });
}
