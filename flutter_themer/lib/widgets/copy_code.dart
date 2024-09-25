import 'package:flutter_themer/utils/exports.dart';

class CopyCode extends StatelessWidget {
  const CopyCode({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: const Text('COPY CODE'),
      shape: actionBtnShape,
      avatar: Icon(Icons.copy, color: Colors.green),
      onPressed: onPressed,
    );
  }
}
