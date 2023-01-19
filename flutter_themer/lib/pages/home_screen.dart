import 'package:flutter_themer/exports/exports.dart';
import 'package:flutter_themer/preview/preview_app.dart';
import 'package:flutter_themer/widgets/parent_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: ParentContainer(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Column(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: const [
                    Expanded(child: PreviewApp()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
