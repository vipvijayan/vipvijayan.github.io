import 'package:flutter_themer/exports/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setWindow();
  runApp(const App());
}
