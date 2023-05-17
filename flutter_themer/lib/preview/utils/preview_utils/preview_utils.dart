import 'package:flutter_themer/utils/exports.dart';

class PreviewUtils {
  static showPreviewAlert(BuildContext context) async {
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

  static Future<void> showPreviewDatePicker(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }
}
