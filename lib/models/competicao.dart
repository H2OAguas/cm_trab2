import 'package:objectbox/objectbox.dart';
import './equipa.dart';

@Entity()
class Competicao {
  @Id()
  int idComp;
  int nJornada;
  int idEquipaCasa;
  int idEquipaVisitante;
  int golosCasa;
  int golosVisitante;
  String resultado;

  Competicao(this.resultado, this.nJornada,
      {this.idComp = 0,
      this.idEquipaCasa = 0,
      this.idEquipaVisitante = 0,
      this.golosCasa = 0,
      this.golosVisitante = 0});
  @Backlink()
  final equipas = ToMany<Equipa>();
}
