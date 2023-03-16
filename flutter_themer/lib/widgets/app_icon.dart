import 'package:flutter_themer/utils/exports.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.dimen = 25,
  });

  final double dimen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimen,
        child: Image.asset(
          'assets/images/favicon.png',
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
