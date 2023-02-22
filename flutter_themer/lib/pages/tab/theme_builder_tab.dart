import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderTab extends StatelessWidget {
  //
  const ThemeBuilderTab({
    super.key,
    required this.themeTab,
  });

  final ThemeParentModel themeTab;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    final themeModelList = themeTab.themeUiModelList;
    final dark = isDarkBrightness(themeTab);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _mainHeader(state),
          const Divider(),
          Expanded(
            child: ListView.separated(
              addAutomaticKeepAlives: true,
              cacheExtent: 200,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: themeModelList.length + 1,
              itemBuilder: (context, index) {
                if (index == themeModelList.length) {
                  return Column(
                    children: [
                      const Divider(height: 20, thickness: 0.1),
                      _customUI(state),
                    ],
                  );
                }
                final uiModel = themeModelList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (uiModel.title.trim().isNotEmpty)
                      ExpandTitle(
                        title: uiModel.title,
                        expanded: uiModel.expanded,
                        onPressed: () async {
                          uiModel.expanded = !uiModel.expanded;
                          state.refresh();
                        },
                      ),
                    if (uiModel.expanded)
                      _mainUI(context, uiModel, dark, state),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _mainHeader(ThemeAppState state) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Flexible(
            child: Row(
              children: [
                const MainTitle(title: 'Brightness'),
                const SizedBox(width: 10),
                CupertinoSwitch(
                  value: !isDarkBrightness(themeTab),
                  onChanged: (on) {
                    themeTab.brightness =
                        on ? Brightness.light : Brightness.dark;
                    state.refresh();
                    state.refreshPreview();
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              openThemeGeneratedScreen();
              state.generateHtml();
            },
            icon: const FaIcon(
              FontAwesomeIcons.fileExport,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  _mainUI(BuildContext context, ThemeUiModel uiModel, bool dark,
      ThemeAppState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: uiModel.items.map((item) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.title.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(item.title, style: Theme.of(context).textTheme.titleSmall),
              ],
              const SizedBox(height: 10),
              Container(
                height: controlsDimen + 30,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey[200],
                ),
                child: ListView.builder(
                  itemCount: item.subItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final subItem = item.subItems[index];
                    Widget widget = Container();
                    if (subItem.input == 'color') {
                      widget = _color(uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'dropdown') {
                      widget = _dropDown(uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'boolean') {
                      widget = _toggle(context, uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'number') {
                      widget = _number(context, uiModel, subItem, dark, state);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: controlsDimen,
                          width: 250,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 30),
                          child: widget,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _customUI(ThemeAppState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              const MainTitle(
                title: customColorsTitle,
                fontSize: 18,
              ),
              const Spacer(),
              IconButton(
                onPressed: (() async {
                  state.customColors.add(
                    CustomColor(
                      id: random.nextInt(50),
                      name: '',
                    ),
                  );
                  state.refresh();
                }),
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const ThemeCustomColorsUI(),
      ],
    );
  }

  ThemeColor _color(
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    ThemeAppState state,
  ) {
    final color =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return ThemeColor(
      uiModel: uiModel,
      subItem: subItem,
      currentColor: color,
      onPressed: (color) async {
        await _updateColor(subItem, color, dark);
        unawaited(state.refreshPreview());
      },
    );
  }

  Widget _number(
    BuildContext context,
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    ThemeAppState state,
  ) {
    final currentVal =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subItem.title,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: NumericStepButton(
            defaultCounter: double.parse(currentVal).toInt(),
            maxValue: 900,
            minValue: 0,
            onDecrement: () async {
              await _decrementNumber(subItem, dark);
              unawaited(state.refreshPreview());
            },
            onIncrement: () async {
              await _incrementNumber(subItem, dark);
              unawaited(state.refreshPreview());
            },
          ),
        ),
      ],
    );
  }

  Widget _toggle(
    BuildContext context,
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    ThemeAppState state,
  ) {
    final currentVal =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          subItem.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 5),
        const Spacer(),
        Expanded(
          child: CupertinoSwitch(
            value: currentVal.parseBool(),
            onChanged: (bool val) async {
              await _updateBoolean(subItem, val, dark);
              unawaited(state.refreshPreview());
            },
          ),
        ),
      ],
    );
  }

  Column _dropDown(
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    ThemeAppState state,
  ) {
    final list = dark ? subItem.dark.value : subItem.light.value;
    final currentVal = list.firstWhere(
      (element) => element.selected,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitle(title: subItem.title),
        const SizedBox(height: 5),
        DropdownButton<Value>(
          isDense: true,
          value: currentVal,
          items: _dropDownItems(
            list,
            dark,
          ),
          onChanged: (Value? value) async {
            await _updateDropDown(
              list,
              value,
              dark,
            );
            unawaited(state.refreshPreview());
          },
        ),
      ],
    );
  }

  _dropDownItems(List<Value> items, bool dark) {
    List<DropdownMenuItem<Value>> dropdownItems = items.map((e) {
      return DropdownMenuItem<Value>(
        value: e,
        child: Text(e.label),
      );
    }).toList();
    return dropdownItems;
  }

  _incrementNumber(SubItem subItem, bool dark) async {
    if (dark) {
      subItem.dark.value.first.value =
          (int.parse(subItem.dark.value.first.value) + 1).toString();
    } else {
      subItem.light.value.first.value =
          (int.parse(subItem.light.value.first.value) + 1).toString();
    }
  }

  _decrementNumber(SubItem subItem, bool dark) async {
    if (dark) {
      final curVal = int.parse(subItem.dark.value.first.value);
      if (curVal <= 0) {
        return;
      }
      subItem.dark.value.first.value = (curVal - 1).toString();
    } else {
      final curVal = int.parse(subItem.light.value.first.value);
      if (curVal <= 0) {
        return;
      }
      subItem.light.value.first.value = (curVal - 1).toString();
    }
  }

  _updateColor(SubItem subItem, Color color, bool dark) async {
    if (dark) {
      subItem.dark.value.first.value = colorHex(color);
    } else {
      subItem.light.value.first.value = colorHex(color);
    }
  }

  _updateDropDown(List<Value> list, Value? selectedValue, bool dark) async {
    if (null == selectedValue) {
      return;
    }
    for (var e in list) {
      e.selected = e.id == selectedValue.id;
    }
  }

  _updateBoolean(SubItem subItem, bool val, bool dark) async {
    if (dark) {
      subItem.dark.value.first.value = val.toString();
    } else {
      subItem.light.value.first.value = val.toString();
    }
  }
}
