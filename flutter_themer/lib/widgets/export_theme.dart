import 'package:flutter_themer/exports/exports.dart';

class ExportTheme extends StatelessWidget {
  const ExportTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Row(
      children: [
        InkWell(
          onTap: () async {
            openThemeGeneratedScreen();
            state.generateHtml();
          },
          child: const MainTitle(title: getTheme),
        ),
        IconButton(
          onPressed: () async {
            openThemeGeneratedScreen();
            state.generateHtml();
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
