import 'package:flutter_themer/utils/exports.dart';
import 'package:flutter_themer/widgets/export_theme.dart';
import 'package:flutter_themer/widgets/number_tf.dart';

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
          const SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              controller: state.scrollController(),
              addAutomaticKeepAlives: true,
              cacheExtent: 200,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: themeModelList.length + 1,
              itemBuilder: (context, index) {
                if (index == themeModelList.length) {
                  return _customUI(state);
                }
                final uiModel = themeModelList[index];
                return Container(
                  // elevation: 1,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(6),
                  // ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade100,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Column(
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
                  ),
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
                    fbLogEvent(
                      name: 'Brightness: ${state.curSelectedThemeModel.id}',
                    );
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          const ExportTheme()
        ],
      ),
    );
  }

  Widget _mainUI(
    BuildContext context,
    ThemeUiModel uiModel,
    bool dark,
    ThemeAppState state,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: uiModel.items.map((item) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.title.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black54,
                        fontSize: titleFontSize,
                      ),
                ),
              ],
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: item.subItems.map((subItem) {
                    Widget widget = const SizedBox.shrink();
                    if (subItem.input == 'color') {
                      widget = _color(uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'dropdown') {
                      widget =
                          _dropDown(context, uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'boolean') {
                      widget = _toggle(context, uiModel, subItem, dark, state);
                    }
                    if (subItem.input == 'number') {
                      widget = _number(context, uiModel, subItem, dark, state);
                    }
                    return Container(
                      height: controlsDimen,
                      width: propertyWidth,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(right: 30, left: 0),
                      child: widget,
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Container _customUI(ThemeAppState state) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 3),
                    BulletIcon(expanded: true),
                    const SizedBox(width: 15),
                    const MainTitle(
                      title: customColorsTitle,
                      fontSize: titleFontSize + 5,
                      txtColor: Colors.green,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    state.customColors.add(
                      CustomColor(
                        id: random.nextInt(50),
                        name: '',
                      ),
                    );
                    unawaited(state.refresh());
                    unawaited(state.scrollDown());
                  },
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
          style: subtitleStyle(context),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: NumberTF(
            initialValue: currentVal,
            onChange: (val) async {
              unawaited(
                handleInput(
                    inputVal: val, subItem: subItem, dark: dark, state: state),
              );
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subItem.title,
          style: subtitleStyle(context),
        ),
        const SizedBox(height: 5),
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
    BuildContext context,
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
        Text(
          subItem.title,
          style: subtitleStyle(context),
        ),
        const Spacer(),
        DropdownButton<Value>(
          isDense: true,
          value: currentVal,
          items: _dropDownItems(context, list, dark),
          onChanged: (Value? value) async {
            await _updateDropDown(list, value, dark);
            unawaited(state.refreshPreview());
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<Value>> _dropDownItems(
      BuildContext context, List<Value> items, bool dark) {
    final dropdownItems = items.map((e) {
      return DropdownMenuItem<Value>(
        value: e,
        child: Text(
          e.label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: titleFontSize - 2),
        ),
      );
    }).toList();
    return dropdownItems;
  }

  Future<void> _updateColor(SubItem subItem, Color color, bool dark) async {
    if (dark) {
      subItem.dark.value.first.value = colorHex(color);
      return;
    }
    subItem.light.value.first.value = colorHex(color);
  }

  Future<void> _updateDropDown(
      List<Value> list, Value? selectedValue, bool dark) async {
    if (null != selectedValue) {
      for (var e in list) {
        e.selected = e.id == selectedValue.id;
      }
    }
  }

  Future<void> _updateBoolean(SubItem subItem, bool val, bool dark) async {
    if (dark) {
      subItem.dark.value.first.value = val.toString();
      return;
    }
    subItem.light.value.first.value = val.toString();
  }
}
