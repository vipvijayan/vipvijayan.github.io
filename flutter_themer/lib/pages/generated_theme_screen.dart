import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_themer/exports/exports.dart';

class GeneratedThemeScreen extends StatelessWidget {
  const GeneratedThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Theme'),
      ),
      body: ParentContainer(
        child: SingleChildScrollView(
          child: Html(data: previewAppState.themeGeneratedHtml),
        ),
      ),
    );
  }
}
