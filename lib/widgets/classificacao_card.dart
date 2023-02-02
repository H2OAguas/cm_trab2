import '../lib.dart';
import '../models/classificacao.dart';

//Utilizado para criar os cards que são apresentados na lista
class ClassificacaoCard extends StatelessWidget {
  final Classificacao classificacao;

  const ClassificacaoCard({Key? key, required this.classificacao})
      : super(key: key);

//     @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 168, 168, 168),
                    blurRadius: 5,
                    offset: Offset(1, 2),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            classificacao.nomeEquipa,
                            style: const TextStyle(
                                fontSize: 15.0,
                                height: 1.0,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      classificacao.pontos.toString(),
                      style: const TextStyle(
                          fontSize: 15.0,
                          height: 1.0,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
