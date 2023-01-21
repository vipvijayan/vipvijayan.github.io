import 'package:flutter_themer/exports/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.draw_outlined),
      ),
    );
  }
}
