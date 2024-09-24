import 'package:flutter_themer/utils/exports.dart';

class ExportTheme extends StatelessWidget {
  const ExportTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    final myColors = Theme.of(context).extension<MyColors>()!;
    return IconButton(
      tooltip: getTheme,
      onPressed: () async {
        openThemeGeneratedScreen();
        state.generateHtml();
      },
      icon: Icon(
        Icons.color_lens,
        color: myColors.success,
        size: appbarIconSize,
      ),
    );
  }
}
