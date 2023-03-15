import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_themer/widgets/app_icon.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppIcon(dimen: 50),
      ),
    );
  }
}
