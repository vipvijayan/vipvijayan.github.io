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
        children: about.items.map((e) {
          return AppListTile(
            title: e.title,
            subtitle: e.value,
            icon: IconData(int.parse(e.icon), fontFamily: 'MaterialIcons'),
            showCopy: e.copyEnabled,
          );
        }).toList(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 25),
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
                              fontSize: 14,
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
      ),
    );
  }
}
