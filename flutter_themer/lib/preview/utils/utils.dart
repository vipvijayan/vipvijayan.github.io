import 'package:flutter_themer/exports/exports.dart';

String colorHex(Color color) => '#${color.value.toRadixString(16)}';

Future<void> showColorDialog(
  BuildContext context, {
  required String title,
  required Function(Color color) onTap,
}) async {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        title: Text(title),
        content: SingleChildScrollView(
          child: HueRingPicker(
            pickerColor: pickerColor,
            onColorChanged: ((color) {
              onTap(color);
            }),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'DONE',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  // showModalBottomSheet(
  //   elevation: 0,
  //   context: context,
  //   builder: (context) {
  //     return Dialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //       elevation: 0,
  //       child: SizedBox(
  //         height: 300,
  //         child: Container(
  //           alignment: Alignment.center,
  //           padding: const EdgeInsets.all(30),
  //           child: ColorPicker(
  //             pickerColor: pickerColor,
  //             pickerAreaBorderRadius: BorderRadius.circular(20),
  //             colorPickerWidth: 600,
  //             onColorChanged: ((color) async {
  //               onTap(color);
  //             }),
  //           ),
  //         ),
  //       ),
  //     );
  //   },
  // );
}
