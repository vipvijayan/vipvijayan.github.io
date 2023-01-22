import 'package:flutter_themer/exports/exports.dart';

class ThemeToggler extends StatelessWidget {
  const ThemeToggler({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeAppState>();
    return Row(
      children: [
        const Text('Dark Mode'),
        Switch(
          value: themeState.darkTheme,
          onChanged: ((value) {
            themeState.setTheme(value);
            context
                .read<PreviewAppState>()
                .init(refresh: true, darkMode: themeState.darkTheme);
            themeState.refresh();
          }),
        ),
      ],
    );
  }
}
