import '../lib.dart';
import 'jogador_reg.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Teste()),
                    );
                  },
                  child: Text('Jogadores',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Competições',
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Teste()),
                    );
                  },
                  child: Text('Equipas',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
