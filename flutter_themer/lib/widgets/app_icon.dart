import 'package:flutter_themer/exports/exports.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.dimen = 25,
  });

  final double dimen;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimen,
      child: Image.asset(
        'assets/images/favicon.png',
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
