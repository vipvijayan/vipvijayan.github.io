import 'package:flutter_themer/utils/exports.dart';

class AboutInfoScreen extends StatelessWidget {
  const AboutInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: about.items.map((e) {
          return AppListTile(
            aboutItem: e,
            action: () async {
              unawaited(_menuAction(state, e));
              unawaited(fbLogEvent(name: 'about_${e.title}'));
            },
          );
        }).toList(),
      ),
    );
  }

  Future<void> _menuAction(ThemeAppState state, AboutItem about) async {
    if (about.link != null && about.link == true) {
      unawaited(openUrl(about.url));
      return;
    }
    if (about.id == appAboutInfoId) {
      return state.showUpdatesHtmlDialog();
    }
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.aboutItem,
    this.action,
  });

  final AboutItem aboutItem;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 6,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap: () async {
        action?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            const SizedBox(width: 10),
            // https://api.flutter.dev/flutter/material/Icons-class.html
            Icon(
              materialIcon(aboutItem.icon),
              size: 20,
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    aboutItem.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                  ),
                  if (null != aboutItem.subtitle &&
                      aboutItem.subtitle!.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            aboutItem.subtitle ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                          ),
                        ),
                        if (aboutItem.copyEnabled)
                          IconButton(
                            padding: EdgeInsets.zero,
                            tooltip: 'copy',
                            iconSize: 20,
                            onPressed: () async {
                              copyToClipboard(aboutItem.subtitle);
                              unawaited(showSnackBar('Copied'));
                            },
                            icon: const Icon(Icons.copy),
                          ),
                        if (!aboutItem.copyEnabled) const SizedBox(height: 40),
                      ],
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
