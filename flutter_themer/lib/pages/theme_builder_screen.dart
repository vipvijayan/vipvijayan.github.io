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
                itemCount: themeUIModelList.length,
                itemBuilder: (context, index) {
                  final uiModel = themeUIModelList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: MainTitle(
                          title: uiModel.title,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
                        child: Column(
                          children: uiModel.items.map((item) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTitle(title: item.title),
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 30,
                                  children: item.subItems.map((subItem) {
                                    if (subItem.input == 'color') {
                                      final val = isDarkMode()
                                          ? subItem.dark.value
                                          : subItem.light.value;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SubTitle(title: subItem.title),
                                          ColorSelector(
                                            title: uiModel.title,
                                            color: HexColor(val),
                                            propertyKey: val,
                                            onTap: (Color color) {
                                              if (isDarkMode()) {
                                                subItem.dark.value =
                                                    colorHex(color);
                                              } else {
                                                subItem.light.value =
                                                    colorHex(color);
                                              }
                                              unawaited(
                                                state.setPreviewTheme(),
                                              );
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
                            );
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


// if (uiChild.input == 'number') {
                            //   return Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       SubTitle(title: uiChild.title),
                            //       NumericStepButton(
                            //         defaultCounter: double.parse(
                            //           state.customTheme[uiChild.key]['value'],
                            //         ).toInt(),
                            //         maxValue: 900,
                            //         minValue: 0,
                            //         onChanged: (int val) {
                            //           state.customTheme[uiChild.key]['value'] =
                            //               val.toString();
                            //           unawaited(state.setPreviewTheme());
                            //         },
                            //       ),
                            //       const SizedBox(height: 20),
                            //     ],
                            //   );
                            // }
                            // if (uiChild.input == 'switch') {
                            //   return Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       SubTitle(title: uiChild.title),
                            //       Switch(
                            //         value: (state.customTheme[uiChild.key]
                            //                 ['value'] as String)
                            //             .parseBool(),
                            //         onChanged: (val) async {
                            //           state.customTheme[uiChild.key]['value'] =
                            //               val.toString();
                            //           unawaited(state.setPreviewTheme());
                            //         },
                            //       ),
                            //       const SizedBox(height: 20),
                            //     ],
                            //   );
                            // }
                            // if (uiChild.input == 'dropdown') {
                            //   final value =
                            //       state.customTheme[uiChild.key]['value'];
                            //   final items = value.split(",");
                            //   return Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       SubTitle(title: uiChild.title),
                            //       DropdownButton<String>(
                            //         value: state.customTheme[uiChild.key]
                            //             ['selected'],
                            //         items: _dropDownItems(items),
                            //         onChanged: (String? value) {
                            //           if (null == value) {
                            //             return;
                            //           }
                            //           state.customTheme[uiChild.key]
                            //               ['selected'] = value;
                            //           state.refresh();
                            //           unawaited(state.setPreviewTheme());
                            //         },
                            //       ),
                            //       const SizedBox(height: 20),
                            //     ],
                            //   );
                            // }
                            // else {
                            //   return const SizedBox.shrink();
                            // }