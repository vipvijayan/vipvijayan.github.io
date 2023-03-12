import 'package:flutter_themer/exports/exports.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.title,
    this.fontSize,
    this.txtColor = Colors.black,
  });

  final String title;
  final double? fontSize;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: fontSize ?? titleFontSize,
              color: txtColor,
              fontWeight: kIsWeb ? FontWeight.w900 : FontWeight.w500,
            ),
      ),
    );
  }
}
