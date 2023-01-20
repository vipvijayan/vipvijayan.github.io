import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewAppState>();
    return Material(
      child: ParentContainer(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.themeUIModelList.length,
                itemBuilder: (context, index) {
                  final uiModel = state.themeUIModelList[index];
                  if (uiModel.titleType == 'main') {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTitle(title: uiModel.title),
                        const Divider(color: Colors.white60, thickness: 0.1),
                        const SizedBox(height: 5),
                      ],
                    );
                  }
                  if (uiModel.titleType == "sub") {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubTitle(title: uiModel.title),
                          if (uiModel.input == 'text_field') ...[
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: uiModel.valueType == 'double',
                              ),
                              onFieldSubmitted: (val) async {
                                final state = context.read<PreviewAppState>();
                                if (uiModel.valueType == 'double') {
                                  if (val.isEmpty) {
                                    val = '0.0';
                                  }
                                }
                                state.addToTheme(
                                  uiModel.key,
                                  val,
                                );
                                state.setPreviewTheme();
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                          if (uiModel.input == 'switch') ...[
                            Switch(
                              value: (state.customTheme[uiModel.key] as String)
                                  .parseBool(),
                              onChanged: (val) async {
                                final state = context.read<PreviewAppState>();
                                state.addToTheme(uiModel.key, val.toString());
                                state.setPreviewTheme();
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                          if (uiModel.input == 'color') ...[
                            const SizedBox(height: 10),
                            ColorSelector(
                              color: HexColor(state.customTheme[uiModel.key]),
                              propertyKey: state.customTheme[uiModel.key],
                              onTap: (Color color) {
                                final state = context.read<PreviewAppState>();
                                state.addToTheme(uiModel.key, colorHex(color));
                                state.setPreviewTheme();
                              },
                            ),
                            const SizedBox(height: 20),
                          ]
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
