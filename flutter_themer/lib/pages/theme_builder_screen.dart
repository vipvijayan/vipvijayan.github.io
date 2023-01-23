import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Material(
      type: MaterialType.transparency,
      child: ParentContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                itemCount: state.themeUIModelList.length,
                itemBuilder: (context, index) {
                  final uiModel = state.themeUIModelList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            uiModel.mainTitle ? 20 : 40, 5, 20, 0),
                        child: MainTitle(
                          title: uiModel.title,
                          fontSize: uiModel.mainTitle ? 24 : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 5, 20, 0),
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 30,
                          children: uiModel.items.map((uiChild) {
                            if (uiChild.input == 'color') {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubTitle(title: uiChild.title),
                                  ColorSelector(
                                    color: HexColor(state
                                        .customTheme[uiChild.key]['value']),
                                    propertyKey: state.customTheme[uiChild.key]
                                        ['value'],
                                    onTap: (Color color) {
                                      state.customTheme[uiChild.key]['value'] =
                                          colorHex(color);
                                      unawaited(state.setPreviewTheme());
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              );
                            }
                            if (uiChild.input == 'text_field') {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubTitle(title: uiChild.title),
                                  NumericStepButton(
                                    defaultCounter: double.parse(
                                      state.customTheme[uiChild.key]['value'],
                                    ).toInt(),
                                    maxValue: 900,
                                    minValue: 0,
                                    onChanged: (int val) {
                                      state.customTheme[uiChild.key]['value'] =
                                          val.toString();
                                      unawaited(state.setPreviewTheme());
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              );
                            }
                            if (uiChild.input == 'switch') {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubTitle(title: uiChild.title),
                                  Switch(
                                    value: (state.customTheme[uiChild.key]
                                            ['value'] as String)
                                        .parseBool(),
                                    onChanged: (val) async {
                                      state.customTheme[uiChild.key]['value'] =
                                          val.toString();
                                      unawaited(state.setPreviewTheme());
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              );
                            }
                            if (uiChild.input == 'dropdown') {
                              final value =
                                  state.customTheme[uiChild.key]['value'];
                              final items = value.split(",");
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubTitle(title: uiChild.title),
                                  DropdownButton<String>(
                                    value: state.customTheme[uiChild.key]
                                        ['selected'],
                                    items: _dropDownItems(items),
                                    onChanged: (String? value) {
                                      if (null == value) {
                                        return;
                                      }
                                      state.customTheme[uiChild.key]
                                          ['selected'] = value;
                                      state.refresh();
                                      unawaited(state.setPreviewTheme());
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              const Divider(height: 20, thickness: 0.1),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                            colorCode: '',
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
        ),
      ),
    );
  }

  _dropDownItems(List<String> items) {
    logD('Items: ${items.toString()}');
    List<DropdownMenuItem<String>> dropdownItems = items.map((e) {
      final values = e.split("#");
      logD("drop: ${values[1]}");
      return DropdownMenuItem(
        value: values[1],
        child: Text(values.first),
      );
    }).toList();
    return dropdownItems;
  }
}
