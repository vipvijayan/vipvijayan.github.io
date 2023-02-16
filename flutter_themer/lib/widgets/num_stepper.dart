import 'package:flutter/material.dart';

class NumericStepButton extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final int defaultCounter;
  final Function onIncrement;
  final Function onDecrement;

  const NumericStepButton({
    Key? key,
    this.minValue = 0,
    this.maxValue = 10,
    this.defaultCounter = 0,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   counter = widget.defaultCounter;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.black12,
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
          Text(
            '$defaultCounter',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
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
              onIncrement();
            },
          ),
        ],
      ),
    );
  }
}
