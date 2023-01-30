import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderTab extends StatefulWidget {
  //
  const ThemeBuilderTab({
    super.key,
    required this.themeTab,
  });

  final ThemeTab themeTab;

  @override
  State<ThemeBuilderTab> createState() => _ThemeBuilderTabState();
}

class _ThemeBuilderTabState extends State<ThemeBuilderTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: ListView(
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: false,
        cacheExtent: 200,
        children: [
          ListView.separated(
            addAutomaticKeepAlives: true,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            cacheExtent: 200,
            separatorBuilder: (context, index) => const Divider(
              height: 20,
              thickness: 0.1,
            ),
            itemCount: themeUIModelList.length,
            itemBuilder: (context, index) {
              final uiModel = themeUIModelList[index];
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
                    Padding(
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
                                  color: Colors.white10,
                                ),
                                child: Row(
                                  children: [
                                    Wrap(
                                      runSpacing: 10,
                                      spacing: 20,
                                      runAlignment: WrapAlignment.spaceBetween,
                                      children: item.subItems.map((subItem) {
                                        if (subItem.input == 'color') {
                                          return ThemeColor(
                                            uiModel: uiModel,
                                            subItem: subItem,
                                            onPressed: (color) async {
                                              await _updateColor(
                                                  subItem, color);
                                              unawaited(state.refreshPreview());
                                            },
                                          );
                                        }
                                        if (subItem.input == 'dropdown') {
                                          final list = Preferences.darkTheme
                                              ? subItem.dark.value
                                              : subItem.light.value;
                                          final currentVal = list.firstWhere(
                                            (element) => element.selected,
                                          );
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SubTitle(title: subItem.title),
                                              DropdownButton<Value>(
                                                isDense: true,
                                                value: currentVal,
                                                items: _dropDownItems(list),
                                                onChanged:
                                                    (Value? value) async {
                                                  await _updateDropDown(
                                                    list,
                                                    value,
                                                  );
                                                  unawaited(
                                                      state.refreshPreview());
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          );
                                        }
                                        if (subItem.input == 'boolean') {
                                          final currentVal = Preferences
                                                  .darkTheme
                                              ? subItem.dark.value.first.value
                                              : subItem.light.value.first.value;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SubTitle(title: subItem.title),
                                              Switch(
                                                value: currentVal.parseBool(),
                                                onChanged: (bool val) async {
                                                  await _updateBoolean(
                                                    subItem,
                                                    val,
                                                  );
                                                  unawaited(
                                                      state.refreshPreview());
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          );
                                        }
                                        if (subItem.input == 'number') {
                                          final currentVal = Preferences
                                                  .darkTheme
                                              ? subItem.dark.value.first.value
                                              : subItem.light.value.first.value;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SubTitle(title: subItem.title),
                                              NumericStepButton(
                                                defaultCounter:
                                                    double.parse(currentVal)
                                                        .toInt(),
                                                maxValue: 900,
                                                minValue: 0,
                                                onDecrement: () async {
                                                  await _decrementNumber(
                                                      subItem);
                                                  unawaited(
                                                      state.refreshPreview());
                                                },
                                                onIncrement: () async {
                                                  await _incrementNumber(
                                                      subItem);
                                                  unawaited(
                                                      state.refreshPreview());
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          );
                                        }
                                        return Container();
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                ],
              );
            },
          ),
          const Divider(height: 20, thickness: 0.1),
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
      ),
    );
  }

  _dropDownItems(List<Value> items) {
    List<DropdownMenuItem<Value>> dropdownItems = items.map((e) {
      return DropdownMenuItem<Value>(
        value: e,
        child: Text(e.label),
      );
    }).toList();
    return dropdownItems;
  }

  _incrementNumber(SubItem subItem) async {
    if (Preferences.darkTheme) {
      subItem.dark.value.first.value =
          (int.parse(subItem.dark.value.first.value) + 1).toString();
    } else {
      subItem.light.value.first.value =
          (int.parse(subItem.light.value.first.value) + 1).toString();
    }
  }

  _decrementNumber(SubItem subItem) async {
    if (subItem.dark.value.first.value == '0') {
      return;
    }
    if (Preferences.darkTheme) {
      subItem.dark.value.first.value =
          (int.parse(subItem.dark.value.first.value) - 1).toString();
    } else {
      subItem.light.value.first.value =
          (int.parse(subItem.light.value.first.value) - 1).toString();
    }
  }

  _updateColor(SubItem subItem, Color color) async {
    if (Preferences.darkTheme) {
      subItem.dark.value.first.value = colorHex(color);
    } else {
      subItem.light.value.first.value = colorHex(color);
    }
  }

  _updateDropDown(List<Value> list, Value? selectedValue) async {
    if (null == selectedValue) {
      return;
    }
    for (var e in list) {
      e.selected = e.id == selectedValue.id;
    }
  }

  _updateBoolean(SubItem subItem, bool val) async {
    if (Preferences.darkTheme) {
      subItem.dark.value.first.value = val.toString();
    } else {
      subItem.light.value.first.value = val.toString();
    }
  }
}
