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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Classificação Liga Portuguesa",
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
              "Classificação Premier League",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            _ListClassificacaoCard2(context),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ListClassificacaoCard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 220,
            child: StreamBuilder<List<Classificacao>>(
              stream: classificacoes.getClassificacoesLP(),
              builder: (context, snapshot) {
                if (snapshot.data?.isNotEmpty ?? false) {
                  return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
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
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ListClassificacaoCard2(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 320,
            child: StreamBuilder<List<Classificacao>>(
              stream: classificacoes.getClassificacoesPL(),
              builder: (context, snapshot) {
                if (snapshot.data?.isNotEmpty ?? false) {
                  return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
