import 'package:flutter_themer/utils/constants/preview_configs.dart';
import 'package:flutter_themer/utils/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  //
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return Column(
      children: [
        if (state.previewLoading) const Loading(),
        if (!state.previewLoading)
          Expanded(
            child: DefaultTabController(
              length: 6,
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
                    isScrollable: true,
                    tabs: previewTabs,
                  ),
                ),
                body: const TabBarView(children: previewTabsChildren),
              ),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class BottomNavigationTab extends StatefulWidget {
  const BottomNavigationTab({super.key});

  @override
  State<BottomNavigationTab> createState() => _BottomNavigationTabState();
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Search', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Profile',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewDemoScreen(),
                ),
              );
            },
            child: const Text('Text Button'),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            icon: Icon(Icons.show_chart),
            onPressed: () async {
              showToast('Hello, How are you?');
            },
            label: const Text('Show a Snackbar'),
          ),
          const SizedBox(height: 20),
          Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  PreviewUtils.showPreviewAlert(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
          Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Text('Outlined Button'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () async {
                  PreviewUtils.showPreviewDatePicker(context);
                },
                child: const Text('Show Date Picker'),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: const Text('Apple'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Google'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Sony'),
                onPressed: () {},
              ),
              TextButton(
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
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Slider: ${_sliderVal.toStringAsFixed(2)}',
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
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context)
                              .dropdownMenuTheme
                              .inputDecorationTheme
                              ?.iconColor,
                        ),
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
                Spacer(),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text('Badge'),
        const SizedBox(height: 10),
        Badge(
          child: Icon(Icons.shopping_cart),
          label: Text("3"),
        )
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

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final selected = index == 3;
                if (index == 0) {
                  return CheckboxListTile(
                    value: true,
                    title: const Text(
                      'Checkbox List Tile Title',
                    ),
                    subtitle: const Text(
                      'Checkbox List Tile Subtitle',
                    ),
                    onChanged: (value) => {},
                  );
                }
                return ListTile(
                  title: Text('Title $index'),
                  subtitle: Row(
                    children: [
                      Text('SubTitle $index'),
                      const Spacer(),
                      Text('${selected ? "[Selected]" : ""}'),
                    ],
                  ),
                  leading: Icon(Icons.call),
                  selected: selected,
                  onTap: () {
                    //
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 12,
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

class NewDemoScreen extends StatelessWidget {
  const NewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Screen to Demo Page Transition\nTap Back button to go back.',
          textAlign: TextAlign.center,
        ),
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
