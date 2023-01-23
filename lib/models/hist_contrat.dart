import 'package:gestao_futebol/models/equipa.dart';
import 'package:gestao_futebol/models/jogador.dart';
import 'package:objectbox/objectbox.dart';
// import 'package:event_manager_objectbox/objectbox.g.dart';

@Entity()
class HistContrat {
  @Id()
  int id;
  int idJogador;
  int idEquipa;
  @Property(type: PropertyType.date)
  DateTime? dataInicio;
  @Property(type: PropertyType.date)
  DateTime? dataFinal;

  HistContrat({
    this.id = 0,
    this.idJogador = 0,
    this.idEquipa = 0,
    this.dataInicio,
    this.dataFinal,
  });

  // final jogador = ToOne<Jogador>();
  // final equipa = ToOne<Equipa>();
}
