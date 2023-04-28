import 'package:flutter/material.dart';
import 'package:flutter_themer/utils/app_utils.dart';

class NumericStepButton extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double defaultCounter;
  final Function onIncrement1;
  final Function onIncrementPoint1;
  final Function onDecrement;
  final Function onDecrementPoint1;

  const NumericStepButton({
    Key? key,
    this.minValue = 0,
    this.maxValue = 10,
    this.defaultCounter = 0,
    required this.onIncrementPoint1,
    required this.onIncrement1,
    required this.onDecrement,
    required this.onDecrementPoint1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vertical = 4.0;
    final horizontal = 5.0;
    return Container(
      padding: EdgeInsets.zero,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.grey[50],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              materialIcon('0xf735'),
              color: Colors.green,
            ),
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              onDecrement();
            },
          ),
          _vDivider(),
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.grey,
            ),
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              onDecrementPoint1();
            },
          ),
          _vDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              defaultCounter.toStringAsFixed(1),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _vDivider(),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              onIncrementPoint1();
            },
          ),
          _vDivider(),
          IconButton(
            icon: Icon(
              materialIcon('0xf734'),
              color: Colors.green,
            ),
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              onIncrement1();
            },
          ),
        ],
      ),
    );
  }

  Widget _vDivider() => const VerticalDivider(
        indent: 10,
        endIndent: 10,
      );
}
