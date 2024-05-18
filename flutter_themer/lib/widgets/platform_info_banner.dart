import 'package:flutter_themer/utils/exports.dart';

class PlatFormInfoBanner extends StatelessWidget {
  const PlatFormInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ThemeAppState>();
    if (state.isMobile) {
      return Container(
        color: Colors.orange,
        child: Row(
          children: [
            Expanded(
              child: Center(child: Text(platformInfo)),
            ),
            CloseButton(
              onPressed: () async {
                state.isMobile = true;
                state.refresh();
              },
            )
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
