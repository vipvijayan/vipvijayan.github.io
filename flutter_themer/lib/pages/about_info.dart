import 'package:flutter_themer/exports/exports.dart';

class AboutInfoScreen extends StatelessWidget {
  const AboutInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          const AppListTile(
            icon: Icons.mail,
            title: 'Contact Email',
            subtitle: supportEmail,
            showCopy: true,
          ),
          const Divider(),
          AppListTile(
            icon: Icons.info,
            title: 'Version',
            subtitle: '${packageInfo.version} $appVersion',
            showCopy: true,
          ),
          const Divider(),
          const AppListTile(
            icon: FontAwesomeIcons.github,
            title: 'Github',
            subtitle: githubUrl,
            showCopy: true,
          )
        ],
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.showCopy = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool showCopy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                    ),
                  ),
                  if (showCopy)
                    IconButton(
                      onPressed: () async {
                        copyToClipboard(subtitle);
                      },
                      icon: const Icon(Icons.copy),
                    )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
