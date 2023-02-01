import 'package:flutter/cupertino.dart';
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
    final state = context.watch<PreviewAppState>();
    final themeModelList = themeTab.themeUiModelList;
    final dark = isDarkBrightness(themeTab);
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          _mainHeader(state),
          Expanded(
            child: ListView.separated(
              addAutomaticKeepAlives: true,
              cacheExtent: 200,
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                thickness: 0.1,
              ),
              itemCount: themeModelList.length,
              itemBuilder: (context, index) {
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
          const Divider(height: 20, thickness: 0.1),
          _customUI(state),
        ],
      ),
    );
  }

  SizedBox _mainHeader(PreviewAppState state) {
    return SizedBox(
      height: 90,
      child: Column(
        children: [
          Row(
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
                icon: const Icon(Icons.view_agenda),
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  _mainUI(
    BuildContext context,
    ThemeUiModel uiModel,
    bool dark,
    PreviewAppState state,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: uiModel.items.map((item) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: item.title),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        runSpacing: 40,
                        spacing: 20,
                        runAlignment: WrapAlignment.spaceBetween,
                        children: item.subItems.map((subItem) {
                          if (subItem.input == 'color') {
                            return _color(uiModel, subItem, dark, state);
                          }
                          if (subItem.input == 'dropdown') {
                            return _dropDown(uiModel, subItem, dark, state);
                          }
                          if (subItem.input == 'boolean') {
                            return _toggle(
                                context, uiModel, subItem, dark, state);
                          }
                          if (subItem.input == 'number') {
                            return _number(uiModel, subItem, dark, state);
                          }
                          return Container();
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _customUI(PreviewAppState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              const MainTitle(
                title: customColorsTitle,
                fontSize: 24,
              ),
              const Spacer(),
              IconButton(
                onPressed: (() {
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
    PreviewAppState state,
  ) {
    final color =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return ThemeColor(
      uiModel: uiModel,
      subItem: subItem,
      currentColor: color,
      onPressed: (color) async {
        await _updateColor(
          subItem,
          color,
          dark,
        );
        unawaited(
          state.refreshPreview(),
        );
      },
    );
  }

  Column _number(
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    PreviewAppState state,
  ) {
    final currentVal =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SubTitle(title: subItem.title),
        NumericStepButton(
          defaultCounter: double.parse(currentVal).toInt(),
          maxValue: 900,
          minValue: 0,
          onDecrement: () async {
            await _decrementNumber(
              subItem,
              dark,
            );
            unawaited(state.refreshPreview());
          },
          onIncrement: () async {
            await _incrementNumber(
              subItem,
              dark,
            );
            unawaited(state.refreshPreview());
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column _toggle(
    BuildContext context,
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    PreviewAppState state,
  ) {
    final currentVal =
        dark ? subItem.dark.value.first.value : subItem.light.value.first.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subItem.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
        ),
        CupertinoSwitch(
          value: currentVal.parseBool(),
          onChanged: (bool val) async {
            await _updateBoolean(
              subItem,
              val,
              dark,
            );
            unawaited(state.refreshPreview());
          },
        ),
      ],
    );
  }

  Column _dropDown(
    ThemeUiModel uiModel,
    SubItem subItem,
    bool dark,
    PreviewAppState state,
  ) {
    final list = dark ? subItem.dark.value : subItem.light.value;
    final currentVal = list.firstWhere(
      (element) => element.selected,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitle(title: subItem.title),
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
        const SizedBox(height: 20),
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
    if (subItem.dark.value.first.value == '0') {
      return;
    }
    if (dark) {
      subItem.dark.value.first.value =
          (int.parse(subItem.dark.value.first.value) - 1).toString();
    } else {
      subItem.light.value.first.value =
          (int.parse(subItem.light.value.first.value) - 1).toString();
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
