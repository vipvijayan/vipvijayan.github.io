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
                actions: [
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(Icons.settings),
                  ),
                  const SizedBox(width: 20),
                ],
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () async {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Buttons'),
                    Tab(text: 'Text'),
                    Tab(text: 'Inputs'),
                    Tab(text: 'Cards'),
                    Tab(text: 'Others'),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  ButtonTab(),
                  TextTab(),
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

class TextTab extends StatelessWidget {
  const TextTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
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
        const AppDivider(),
        Text(
          'Display Small',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const AppDivider(),
        Text(
          'Display Medium',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const AppDivider(),
        Text(
          'Display Large',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
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
  bool _filterChipSelected = false;

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
    const Text('Mango'),
  ];

  final List<bool> _selectedFruits = <bool>[true, false, false, false];
  // Toggle End

  String _company = 'apple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.favorite),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        addAutomaticKeepAlives: true,
        children: [
          Center(
            child: ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedFruits.length; i++) {
                    _selectedFruits[i] = i == index;
                  }
                });
              },
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedFruits,
              children: fruits,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              //
            },
            child: const Text('Text Button'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              showToast('Hello, How are you?');
            },
            child: const Text('Show a Snackbar'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  showPreviewAlert(context);
                },
                child: Row(
                  children: const [
                    Icon(Icons.star_border),
                    SizedBox(width: 10),
                    Text('Elevated Button'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {},
                child: const Text('Elevated Button'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {},
                child: Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Text('Outlined Button'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () async {},
                child: const Text('Outlined Button'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FilledButton(onPressed: () {}, child: const Text('Filled Button')),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChip(
                label: const Text('Sony'),
                selected: _filterChipSelected,
                onSelected: (value) {
                  setState(() {
                    _filterChipSelected = !_filterChipSelected;
                  });
                },
              ),
              const SizedBox(width: 10),
              const Chip(label: Text('Apple')),
              const SizedBox(width: 10),
              const Chip(
                label: Text('Google'),
                deleteIcon: Icon(Icons.delete),
              ),
              const SizedBox(width: 10),
              FilterChip(
                label: const Text('Samsung'),
                selected: _filterChipSelected,
                onSelected: (value) {
                  setState(() {
                    _filterChipSelected = !_filterChipSelected;
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Apple'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: const Text('Google'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: const Text('Sony'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: const Text('Nokia'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                'Select your company',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              RadioListTile(
                title: const Text('Apple'),
                value: 'apple',
                groupValue: _company,
                onChanged: (value) {
                  setState(() {
                    _company = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('Google'),
                value: 'google',
                groupValue: _company,
                onChanged: (value) {
                  setState(() {
                    _company = value.toString();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _switch1 ? 'Turn Off Notifications' : 'Turn On Notifications',
                style: Theme.of(context).textTheme.labelLarge,
              ),
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
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Font Size: ${_sliderVal.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Slider(
                value: _sliderVal,
                onChanged: (value) {
                  setState(() {
                    _sliderVal = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
                  const Text('Text Form Field'),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Tap Submit'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _checked,
                        onChanged: (value) {
                          setState(() {
                            _checked = !_checked;
                          });
                        },
                      ),
                      Text(
                        'Flutter',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(width: 20),
                      Checkbox(
                        value: !_checked,
                        onChanged: (value) {
                          setState(() {
                            _checked = !_checked;
                          });
                        },
                      ),
                      Text(
                        'React Native',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                Text('Hello'),
                const Spacer(),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

Widget _drawer() {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const DrawerHeader(
          child: Icon(Icons.face_outlined),
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            Icon(Icons.favorite_border),
            SizedBox(width: 20),
            Text('Favorites'),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            Icon(Icons.rate_review_outlined),
            SizedBox(width: 20),
            Text('Rate App'),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            Icon(Icons.contact_mail_outlined),
            SizedBox(width: 20),
            Text('Contact Us'),
          ],
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 20),
                const Text('Divider'),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                const ListTile(
                  title: Text('List Title'),
                  subtitle: Text('List SubTitle'),
                  leading: Icon(Icons.alarm),
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  value: true,
                  title: const Text(
                    'Checkbox List Tile Title',
                  ),
                  subtitle: const Text(
                    'Checkbox List Tile Subtitle',
                  ),
                  onChanged: (value) => {},
                ),
              ],
            ),
          ),
          BottomAppBar(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.menu),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.home),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.info),
                    ),
                  ],
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
