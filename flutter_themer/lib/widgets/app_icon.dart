import 'package:flutter_themer/utils/exports.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.dimen = 60,
  });

  final double dimen;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimen,
      child: Image.asset(logoPath, filterQuality: FilterQuality.high),
    );
  }
}
