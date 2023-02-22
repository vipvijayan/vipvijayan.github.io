import 'package:flutter_themer/exports/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  //
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DefaultTabController(
            length: 5,
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
                    Tab(text: 'Others'),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  DemoTab(),
                  ButtonTab(),
                  InputTab(),
                  CardTab(),
                  OthersTab(),
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
          const AppDivider(),
          Text(
            'Body Medium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const AppDivider(),
          Text(
            'Body Small',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const AppDivider(),
          Text(
            'Title Large',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const AppDivider(),
          Text(
            'Title Medium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const AppDivider(),
          Text(
            'Title Small',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const AppDivider(),
          Text(
            'Label Large',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const AppDivider(),
          Text(
            'Label Medium',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const AppDivider(),
          Text(
            'Label Small',
            style: Theme.of(context).textTheme.labelSmall,
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
  double _sliderVal = 0.3;

  // Initial Selected Value
  String dropdownvalue = 'Apple';

  // List of items in our dropdown menu
  var items = [
    'Apple',
    'Google',
    'Samsung',
    'Nokia',
    'Sony',
  ];

  // Toggle Start
  List<Widget> fruits = <Widget>[
    const Text('Apple'),
    const Text('Banana'),
    const Text('Orange'),
  ];

  final List<bool> _selectedFruits = <bool>[true, false, false];
  // Toggle End

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.favorite),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextButton(
            onPressed: () async {
              showToast("Hello, How are you?");
            },
            child: const Text('Text Button'),
          ),
          const AppDivider(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              showPreviewAlert(context);
            },
            child: const Text('Elevated Button Button'),
          ),
          const AppDivider(),
          FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          const AppDivider(),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedFruits.length; i++) {
                  _selectedFruits[i] = i == index;
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedFruits,
            children: fruits,
          ),
          const AppDivider(),
          const Text('Chips'),
          const SizedBox(height: 10),
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
          const AppDivider(),
          const Text('ButtonBar'),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: const Text("Apple"),
                onPressed: () {},
              ),
              TextButton(
                child: const Text("Google"),
                onPressed: () {},
              ),
            ],
          ),
          const AppDivider(),
          const Text('Icon Button'),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.info_outline),
          ),
          const AppDivider(),
          const Text('Radio'),
          Radio(value: true, groupValue: true, onChanged: (val) {}),
          const AppDivider(),
          const Text('Switch'),
          Switch(
            value: _switch1,
            onChanged: (val) {
              setState(() {
                _switch1 = !_switch1;
              });
            },
          ),
          const AppDivider(),
          const Text('Slider'),
          Slider(
            value: _sliderVal,
            onChanged: (value) {
              setState(() {
                _sliderVal = value;
              });
            },
          ),
          const AppDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Dropdown Button'),
              DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  showToast(String text) async {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(content: Text(text)),
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
                  const Text('Text Input'),
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
                  const Divider(height: 40),
                  const Text('Checkbox'),
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
          AppDivider(),
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

class OthersTab extends StatefulWidget {
  const OthersTab({super.key});

  @override
  State<OthersTab> createState() => _OthersTabState();
}

class _OthersTabState extends State<OthersTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                SizedBox(height: 20),
                Text('Divider'),
                SizedBox(height: 20),
                Divider(),
              ],
            ),
          ),
          BottomAppBar(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bottom navigation Bar',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      thickness: 0.1,
      height: 40,
    );
  }
}
