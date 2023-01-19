import 'package:flutter_themer/exports/exports.dart';

class ParentContainer extends StatelessWidget {
  const ParentContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
