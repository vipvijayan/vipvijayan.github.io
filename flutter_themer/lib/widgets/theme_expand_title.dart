import 'package:flutter_themer/exports/exports.dart';

class ExpandTitle extends StatelessWidget {
  const ExpandTitle({
    super.key,
    required this.title,
    required this.expanded,
    required this.onPressed,
  });

  final String title;
  final bool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: MainTitle(
              title: title,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              expanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
            ),
          )
        ],
      ),
    );
  }
}
