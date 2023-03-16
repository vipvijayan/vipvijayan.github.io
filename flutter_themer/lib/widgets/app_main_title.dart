import 'package:flutter_themer/utils/exports.dart';

class AppMainTitle extends StatelessWidget {
  const AppMainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 25),
        const AppIcon(),
        const SizedBox(width: 10),
        Text(
          appTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
