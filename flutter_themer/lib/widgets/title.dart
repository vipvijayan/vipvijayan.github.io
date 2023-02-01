import 'package:flutter_themer/exports/exports.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
    );
  }
}
