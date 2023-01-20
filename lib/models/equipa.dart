import 'package:objectbox/objectbox.dart';
import 'competicao.dart';
// import 'package:event_manager_objectbox/objectbox.g.dart';

@Entity()
class Equipa {
  @Id()
  int id;
  String nome;

  Equipa(this.nome, {this.id = 0});

  final competicao = ToOne<Competicao>();
}