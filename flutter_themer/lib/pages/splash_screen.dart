import 'package:flutter_themer/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: AppIcon(dimen: 50));
  }
}
