import 'package:flutter_themer/exports/exports.dart';

class ThemeBuilderScreen extends StatelessWidget {
  //
  const ThemeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeAppState>();
    return DefaultTabController(
      length: state.themeParentModels.length,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) async {
            // state.currentThemeTabIndex = index;
            state.curSelectedThemeModel = state.themeParentModels[index];
            state.refresh();
          },
          labelColor: Colors.black,
          tabs: state.themeParentModels.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  e.title,
                ),
              );
            },
          ).toList(),
        ),
        body: TabBarView(
          children: state.themeParentModels.map((e) {
            return ThemeBuilderTab(themeTab: e);
          }).toList(),
        ),
      ),
    );
  }
}



//   return Container(
    //     color: Theme.of(context).scaffoldBackgroundColor,
    //     child: Column(children: [
    //       Row(
    //         children: state.themeParentModels.map(
    //           (e) {
    //             return InkWell(
    //               onTap: () async {
    //                 state.currentThemeTabIndex = e.id;
    //                 state.curSelectedThemeModel = state.themeParentModels[e.id];
    //                 // state.refreshPreview();
    //                 state.refresh();
    //               },
    //               child: Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Text(
    //                   e.title,
    //                 ),
    //               ),
    //             );
    //           },
    //         ).toList(),
    //       ),
    //       if (state.currentThemeTabIndex == ThemeIDs.basic.value)
    //         Expanded(
    //           child: ThemeBuilderTab(themeTab: state.themeParentModels.first),
    //         ),
    //       if (state.currentThemeTabIndex == ThemeIDs.advanced.value)
    //         Expanded(
    //           child: ThemeBuilderTab(themeTab: state.themeParentModels[1]),
    //         ),
    //     ]),
    //   );