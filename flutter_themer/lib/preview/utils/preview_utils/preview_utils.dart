import 'package:flutter_themer/exports/exports.dart';

showPreviewAlert(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: const Text('Welcome'),
          content: const Text('Flutter'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ACCEPT'),
            ),
          ],
        ),
      );
    },
  );
}
