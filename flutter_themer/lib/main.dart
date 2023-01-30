import 'package:flutter_themer/exports/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await setWindowSize();
  runApp(const App());
}
