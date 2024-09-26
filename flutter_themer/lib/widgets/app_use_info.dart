import 'package:flutter/material.dart';
import 'package:flutter_themer/utils/nav_utils.dart';

class AppUseInfo extends StatelessWidget {
  const AppUseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.bodyLarge;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Quick tutorial',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            IconButton(
              onPressed: () {
                closeScreen();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
        const SizedBox(height: 10),
        Text(
          '1. Select any of the tabs: Primary, Basic, or Advanced',
          style: subtitleStyle,
        ),
        Text(
          '2. Preview your design in real-time',
          style: subtitleStyle,
        ),
        Text(
          '3. Tap Generate Theme to create your theme',
          style: subtitleStyle,
        ),
        Text(
          '4. Copy the code and follow the instructions to integrate it into your app',
          style: subtitleStyle,
        ),
      ],
    );
  }
}
