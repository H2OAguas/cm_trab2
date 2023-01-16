import 'package:event_manager_objectbox/main.dart';
import 'package:event_manager_objectbox/objectbox.g.dart';

@Entity()
class Jogador {
  @Id()
  int id;
  String nome;
  String? idade;
  bool ativo;
  @Property(type: PropertyType.date)
  DateTime? dataUltCtrlDopp;

  Jogador(this.nome, this.idade, this.dataUltCtrlDopp,
      {this.ativo = true, this.id = 0});
}
