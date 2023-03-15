import 'package:flutter_themer/utils/exports.dart';

class ParentContainer extends StatelessWidget {
  const ParentContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
