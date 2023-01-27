import 'package:flutter_themer/exports/exports.dart';

class GeneratedThemeScreen extends StatelessWidget {
  //
  const GeneratedThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Theme'),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     copyToClipboard(previewAppState.themeGeneratedHtml);
          //   },
          //   icon: const Icon(Icons.copy),
          // )
        ],
      ),
      body: ParentContainer(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: HighlightView(
                      previewAppState.themeGeneratedHtml,
                      language: 'dart',
                      theme: githubGistTheme,
                      padding: const EdgeInsets.all(20),
                      textStyle: const TextStyle(
                        fontFamily: 'courier',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      onPressed: () async {
                        copyToClipboard(
                          previewAppState.themeGeneratedHtml,
                          callback: () {
                            showToast('Code Copied');
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              if (previewAppState.customHtml.isNotEmpty)
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        onPressed: () async {
                          copyToClipboard(
                            previewAppState.customHtml,
                            callback: () {
                              showToast('Code Copied');
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: HighlightView(
                        previewAppState.customHtml,
                        language: 'dart',
                        theme: githubGistTheme,
                        padding: const EdgeInsets.all(20),
                        textStyle: const TextStyle(
                          fontFamily: 'courier',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
