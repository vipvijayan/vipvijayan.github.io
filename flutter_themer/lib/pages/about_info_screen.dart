import 'package:flutter_themer/utils/exports.dart';

class AboutInfoScreen extends StatelessWidget {
  const AboutInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          'About',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 30),
        const Divider(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(30),
            itemCount: about.items.length,
            itemBuilder: (context, index) {
              final e = about.items[index];
              return AppListTile(
                aboutItem: e,
                action: () async {
                  unawaited(_menuAction(state, e));
                  unawaited(fbLogEvent(name: 'about_${e.title}'));
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
        ),
      ],
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
    return ListTile(
      onTap: action,
      leading: Icon(
        materialIcon(aboutItem.icon),
        size: 40,
      ),
      minLeadingWidth: 60,
      title: Text(
        aboutItem.title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 16,
              color: Colors.grey,
            ),
      ),
      subtitle: aboutItem.subtitle != null && aboutItem.subtitle!.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        aboutItem.subtitle ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                      ),
                    ),
                    if (aboutItem.copyEnabled)
                      IconButton(
                        padding: EdgeInsets.zero,
                        tooltip: 'Copy',
                        iconSize: 20,
                        onPressed: () async {
                          copyToClipboard(aboutItem.subtitle);
                          unawaited(showSnackBar('Copied'));
                        },
                        icon: const Icon(Icons.copy),
                      ),
                  ],
                ),
              ],
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      tileColor: Colors.transparent,
    );
  }
}
