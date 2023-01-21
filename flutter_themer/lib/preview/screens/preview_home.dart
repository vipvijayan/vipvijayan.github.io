import 'package:flutter_themer/exports/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      // color: HexColor('#28282B'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      width: 440,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 90),
                    height: 900,
                    width: 440,
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Scaffold(
                        appBar: AppBar(
                          title: const Text(
                            'Preview',
                          ),
                          actions: const [
                            Icon(Icons.settings),
                            SizedBox(width: 20),
                          ],
                          leading: const Icon(Icons.menu),
                          bottom: const TabBar(
                            tabs: [
                              Tab(
                                text: 'Text',
                              ),
                              Tab(
                                text: 'Buttons',
                              ),
                              Tab(
                                text: 'Cards',
                              ),
                            ],
                          ),
                        ),
                        body: const TabBarView(
                          children: [
                            DemoTab(),
                            ButtonTab(),
                            CardTab(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Image.asset(
                      'assets/images/iphone_14_1.png',
                      filterQuality: FilterQuality.high,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DemoTab extends StatelessWidget {
  const DemoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body Large',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(height: 30),
          Text(
            'Body Medium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Divider(height: 20),
          Text(
            'Body Small',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(height: 20),
          Text(
            'Title Large',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(height: 20),
          Text(
            'Title Medium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(height: 20),
          Text(
            'Title Small',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

class ButtonTab extends StatelessWidget {
  const ButtonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () async {
              //
            },
            child: const Text('Text Button'),
          ),
        ],
      ),
    );
  }
}

class CardTab extends StatelessWidget {
  const CardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Card(
            child: ListTile(
              dense: false,
              leading: Icon(Icons.favorite_border),
              contentPadding: EdgeInsets.all(20),
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text(
                'Hello',
              ),
              subtitle: Text(
                'Flutter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
