import 'package:flutter_themer/exports/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: Scaffold(
              key: scaffoldKey,
              drawer: _drawer(),
              appBar: AppBar(
                title: const Text(previewTitle),
                actions: const [
                  Icon(Icons.settings),
                  SizedBox(width: 20),
                ],
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () async {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Text'),
                    Tab(text: 'Buttons'),
                    Tab(text: 'Inputs'),
                    Tab(text: 'Cards'),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  DemoTab(),
                  ButtonTab(),
                  InputTab(),
                  CardTab(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
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

class ButtonTab extends StatefulWidget {
  const ButtonTab({super.key});

  @override
  State<ButtonTab> createState() => _ButtonTabState();
}

class _ButtonTabState extends State<ButtonTab> {
  bool _switch1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                showToast("Hello, How are you?");
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                showToast("Hello, How are you?");
              },
              child: const Text('Elevated Button Button'),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Chip(label: Text('Hello')),
                SizedBox(width: 10),
                Chip(
                  label: Text('Hello'),
                  deleteIcon: Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.info_outline),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('Radio'),
            Radio(value: true, groupValue: true, onChanged: (val) {}),
            const Divider(),
            const SizedBox(height: 20),
            const Text('Switch'),
            Switch(
              value: _switch1,
              onChanged: (val) {
                setState(() {
                  _switch1 = !_switch1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  showToast(String text) async {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: Theme.of(scaffoldKey.currentContext!).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class InputTab extends StatefulWidget {
  const InputTab({super.key});

  @override
  State<InputTab> createState() => _InputTabState();
}

class _InputTabState extends State<InputTab> {
  final _formKey = GlobalKey<FormState>();

  bool _checked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'name'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 10),
                  Checkbox(
                    value: _checked,
                    onChanged: (value) {
                      setState(() {
                        _checked = !_checked;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    title: Text('List Title'),
                    leading: Icon(Icons.alarm),
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    value: true,
                    title: Text(
                      'Apple',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (value) => {},
                  ),
                  const SizedBox(height: 10),
                ],
              ),
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

Widget _drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Icon(Icons.face_outlined),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
