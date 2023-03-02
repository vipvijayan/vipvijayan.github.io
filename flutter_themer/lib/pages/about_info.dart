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
        padding: const EdgeInsets.all(20),
        children: const [
          AppListTile(
            icon: Icons.mail_outline,
            title: 'Contact Email',
            subtitle: 'flutterthemer@gmail.com',
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
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                ),
                const Spacer(),
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
        ))
      ],
    );
  }
}
