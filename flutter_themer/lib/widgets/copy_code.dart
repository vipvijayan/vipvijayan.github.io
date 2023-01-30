import 'package:flutter_themer/exports/exports.dart';

class CopyCode extends StatelessWidget {
  const CopyCode({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('COPY CODE'),
        IconButton(
          onPressed: () async {
            onPressed();
          },
          icon: const Icon(
            Icons.copy,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
