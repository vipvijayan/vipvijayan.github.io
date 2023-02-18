import 'package:flutter_themer/exports/exports.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title, this.fontSize});

  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: fontSize ?? 14),
      ),
    );
  }
}
