import 'package:flutter_themer/utils/exports.dart';

class ExportTheme extends StatelessWidget {
  const ExportTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return TextButton(
      onPressed: () async {
        openThemeGeneratedScreen();
        state.generateHtml();
      },
      child: Text(
        getTheme,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: titleFontSize,
              fontWeight: kIsWeb ? FontWeight.w900 : FontWeight.w600,
            ),
      ),
    );
  }
}
