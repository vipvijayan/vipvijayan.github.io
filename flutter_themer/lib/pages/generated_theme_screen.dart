import 'package:flutter_themer/utils/exports.dart';

class GeneratedThemeScreen extends StatelessWidget {
  //
  const GeneratedThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<ThemeAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Theme'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CopyCode(
                      onPressed: () async {
                        unawaited(_copy(previewAppState.themeGeneratedHtml));
                      },
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: HighlightView(
                            previewAppState.themeGeneratedHtml,
                            language: 'dart',
                            theme: githubGistTheme,
                            padding: const EdgeInsets.all(20),
                            textStyle: const TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (previewAppState.customHtml.isNotEmpty)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CopyCode(
                        onPressed: () async {
                          unawaited(_copy(previewAppState.customHtml));
                        },
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: HighlightView(
                          previewAppState.customHtml,
                          language: 'dart',
                          theme: githubGistTheme,
                          padding: const EdgeInsets.all(20),
                          textStyle: const TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _copy(String text) async {
    unawaited(copyToClipboard(
      text,
      callback: () async {
        showSnackBar(codeCopied);
      },
    ));
  }
}
