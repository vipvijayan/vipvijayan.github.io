import 'package:flutter_themer/exports/exports.dart';

void main() async {
  timeDilation = 2.0;
  WidgetsFlutterBinding.ensureInitialized();
  await setWindow();
  runApp(const App());
}
