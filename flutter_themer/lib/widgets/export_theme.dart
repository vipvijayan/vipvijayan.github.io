import 'package:flutter_themer/utils/exports.dart';

class ExportTheme extends StatelessWidget {
  const ExportTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    final myColors = Theme.of(context).extension<MyColors>()!;
    return OutlinedButton.icon(
      onPressed: () async {
        openThemeGeneratedScreen();
        state.generateHtml();
      },
      icon: Icon(
        FontAwesomeIcons.bucket,
        color: myColors.success,
        size: titleFontSize,
      ),
      label: Text(
        getTheme,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: titleFontSize,
              fontWeight: kIsWeb ? FontWeight.w900 : FontWeight.w600,
              color: myColors.success,
            ),
      ),
    );
  }
}
