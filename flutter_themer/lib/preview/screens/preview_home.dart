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
            child: SizedBox(
              height: 900,
              width: 800,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 23,
                    left: 58.5,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      width: 400,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      margin: const EdgeInsets.only(top: 60),
                      height: 790,
                      width: 400,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.green,
                      ),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text(previewTitle),
                            actions: const [
                              Icon(Icons.settings),
                              SizedBox(width: 20),
                            ],
                            leading: const Icon(Icons.menu),
                            bottom: const TabBar(
                              tabs: [
                                Tab(text: 'Text'),
                                Tab(text: 'Buttons'),
                                Tab(text: 'Cards'),
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
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Image.asset(
                      iphoneBg,
                      height: 900,
                      width: 700,
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Hello, How are you?"),
                  ),
                );
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Hello, How are you?"),
                  ),
                );
              },
              child: const Text('Elevated Button Button'),
            ),
          ],
        ),
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
          SizedBox(height: 30),
          Divider(),
          SizedBox(height: 30),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
