import '../data/classificacoes.dart';
import '../models/classificacao.dart';
import 'classificacao_list.dart';
import '../lib.dart';

class ClassificacoesPage extends StatefulWidget {
  const ClassificacoesPage({Key? key}) : super(key: key);

  @override
  State<ClassificacoesPage> createState() => _ClassificacoesPageState();
}

class _ClassificacoesPageState extends State<ClassificacoesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Expanded(child: ClassificacaoList()),
          ],
        ),
      ),
    );
  }
}
