import 'package:flutter_themer/utils/exports.dart';

class BulletIcon extends StatelessWidget {
  //
  const BulletIcon({
    super.key,
    this.expanded = false,
  });
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: expanded ? Colors.blue.shade400 : Colors.grey.shade200,
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
