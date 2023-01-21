import 'package:flutter_themer/exports/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
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
                  Container(
                    margin: const EdgeInsets.only(top: 45),
                    height: 880,
                    width: 430,
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Scaffold(
                        appBar: AppBar(
                          title: const Text('Title'),
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
                                text: 'Tab 3',
                              ),
                            ],
                          ),
                        ),
                        body: const TabBarView(
                          children: [
                            DemoTab(),
                            DemoTab(),
                            DemoTab(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 40,
                    child: Container(
                      height: 50,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      width: 430,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Image.asset(
                      'assets/images/iphone_14.png',
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
          const SizedBox(height: 20),
          Text(
            'Body Medium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Body Small',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          Text(
            'Title Large',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Title Medium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Title Small',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 20),
          const Card(
            child: ListTile(
              title: Text('Hello'),
              subtitle: Text('Flutter'),
            ),
          ),
          TextButton(
            onPressed: () async {
              //
            },
            child: const Text('Tap Me'),
          ),
        ],
      ),
    );
  }
}
