import 'dart:async';

import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/widgets/num_stepper.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Material(
      type: MaterialType.transparency,
      // color: HexColor('#28282B'),
      child: ParentContainer(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                addAutomaticKeepAlives: true,
                cacheExtent: 200,
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                  // color: Colors.transparent,
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
                                    color: HexColor(
                                        state.customTheme[uiChild.key]),
                                    propertyKey: state.customTheme[uiChild.key],
                                    onTap: (Color color) {
                                      state.addToTheme(
                                          uiChild.key, colorHex(color));
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
                                      state.customTheme[uiChild.key],
                                    ).toInt(),
                                    maxValue: 50,
                                    minValue: 0,
                                    onChanged: (int val) {
                                      state.addToTheme(
                                          uiChild.key, val.toString());
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
                                            as String)
                                        .parseBool(),
                                    onChanged: (val) async {
                                      state.addToTheme(
                                          uiChild.key, val.toString());
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
            ),
          ],
        ),
      ),
    );
  }
}
