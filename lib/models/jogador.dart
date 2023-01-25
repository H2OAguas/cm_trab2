import 'package:gestao_futebol/models/hist_contrat.dart';
import 'package:objectbox/objectbox.dart';
// import 'package:gestao_futebol/';

@Entity()
class Jogador {
  @Id()
  int id;
  String nome;
  String? idade;
  bool ativo;
  @Property(type: PropertyType.date)
  DateTime? dataUltCtrlDopp;

  Jogador(this.nome, this.idade, DateTime? dataUltCtrlDopp,
      {this.ativo = true, this.id = 0})
      : this.dataUltCtrlDopp = dataUltCtrlDopp ?? DateTime.now();
}
