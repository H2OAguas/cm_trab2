import '../lib.dart';
import '../models/jogador.dart';
import './jogador_list.dart';
import './jogador_add.dart';

class JogadorPage extends StatefulWidget {
  // final Jogador jogador;

  const JogadorPage({Key? key}) : super(key: key);

  @override
  State<JogadorPage> createState() => _JogadorPageState();
}

class _JogadorPageState extends State<JogadorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      // appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Expanded(child: JogadorList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const JogadorAdd()));
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
