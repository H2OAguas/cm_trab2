import 'package:gestao_futebol/widgets/equipa_list.dart';
import 'package:gestao_futebol/widgets/jogador_page.dart';
import 'package:gestao_futebol/widgets/classificacoes_page.dart';
import '../lib.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Column(
      children: <Widget>[
        Text('Gestão Futebol', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const JogadorPage()));
                  },
                  child: Text('Jogadores',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ClassificacoesPage()));
                  },
                  child: Text('Competições',
                      // style: Theme.of(context).textTheme.headline6),
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EquipaList()),
                    );
                  },
                  child: Text('Equipas',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
