
import 'lib.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: MyAppBar(),
        body: CtrlDoppList(),
      ),
    );
  }
}
