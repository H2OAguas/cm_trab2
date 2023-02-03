import 'package:gestao_futebol/data/classificacoes.dart';
import 'package:gestao_futebol/models/competicao.dart';
import '../lib.dart';
import './classificacao_card.dart';
import '../main.dart';
import '../models/classificacao.dart';
import '../data/classificacoes.dart';
import 'app_bar.dart';

/// Generates and returns a widget with list of events stored in the Box.
class ClassificacaoList extends StatefulWidget {
  const ClassificacaoList({Key? key}) : super(key: key);
  @override
  State<ClassificacaoList> createState() => _ClassificacaoListState();
}

class _ClassificacaoListState extends State<ClassificacaoList> {
  // const CtrlDoppList({Key? key}) : super(key: key);
  Classificacoes classificacoes = Classificacoes();

  ClassificacaoCard Function(BuildContext, int) _itemBuilder(
          List<Classificacao> classificacoes) =>
      (BuildContext context, int index) =>
          ClassificacaoCard(classificacao: classificacoes[index]);

  String dropdownValue = 'J1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton(
              value: dropdownValue,
              items: [
                DropdownMenuItem(child: Text("J1"), value: "J1"),
                DropdownMenuItem(child: Text("J2"), value: "J2"),
                DropdownMenuItem(child: Text("J3"), value: "J3"),
                DropdownMenuItem(child: Text("J4"), value: "J4"),
                DropdownMenuItem(child: Text("J5"), value: "J5"),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value.toString();
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Classificação Liga Portugal BWIN",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            _ListClassificacaoCard(context),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Classificação Liga Portugal 2",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            _ListClassificacaoCard2(context),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ListClassificacaoCard(BuildContext context) {
    Stream<List<Classificacao>> stream = Stream.empty();
    switch (dropdownValue) {
      case 'J1':
        stream = classificacoes.getClassificacoesLPB1();
        break;
      case 'J2':
        stream = classificacoes.getClassificacoesLPB2();
        break;
      case 'J3':
        stream = classificacoes.getClassificacoesLPB3();
        break;
      case 'J4':
        stream = classificacoes.getClassificacoesLPB4();
        break;
      case 'J5':
        stream = classificacoes.getClassificacoesLPB5();
        break;
    }
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 300,
          child: StreamBuilder<List<Classificacao>>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.data?.isNotEmpty ?? false) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: _itemBuilder(snapshot.data ?? []));
              } else {
                return const Center(child: Text(""));
              }
            },
          ),
        ),
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  Widget _ListClassificacaoCard2(BuildContext context) {
    Stream<List<Classificacao>> stream = Stream.empty();
    switch (dropdownValue) {
      case 'J1':
        stream = classificacoes.getClassificacoesLP1();
        break;
      case 'J2':
        stream = classificacoes.getClassificacoesLP2();
        break;
      case 'J3':
        stream = classificacoes.getClassificacoesLP3();
        break;
      case 'J4':
        stream = classificacoes.getClassificacoesLP4();
        break;
      case 'J5':
        stream = classificacoes.getClassificacoesLP5();
        break;
    }
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 300,
          child: StreamBuilder<List<Classificacao>>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.data?.isNotEmpty ?? false) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: _itemBuilder(snapshot.data ?? []));
              } else {
                return const Center(child: Text(""));
              }
            },
          ),
        ),
      ],
    ));
  }
}
