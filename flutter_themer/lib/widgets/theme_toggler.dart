import 'package:flutter_themer/exports/exports.dart';

class ThemeToggler extends StatelessWidget {
  const ThemeToggler({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Row(
      children: [
        Text(
          'DARK',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Switch(
          value: state.darkTheme,
          onChanged: ((value) {
            Preferences.darkTheme = value;
            state.darkTheme = value;
            state.refresh();
            unawaited(
              state.refreshPreview(),
            );
          }),
        ),
      ],
    );
  }
}
