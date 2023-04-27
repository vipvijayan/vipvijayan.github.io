import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.grey[50],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 18.0,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              onDecrement();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 18.0,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              onDecrementPoint1();
            },
          ),
          Text(
            defaultCounter.toStringAsFixed(1),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 18.0,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              onIncrementPoint1();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 18.0,
            ),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              onIncrement1();
            },
          ),
        ],
      ),
    );
  }
}
