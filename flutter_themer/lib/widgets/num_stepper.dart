import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int defaultCounter;
  final ValueChanged<int> onChanged;

  const NumericStepButton({
    Key? key,
    this.minValue = 0,
    this.maxValue = 10,
    this.defaultCounter = 0,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  //
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.defaultCounter;
  }

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
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if (counter > widget.minValue) {
                  counter--;
                }
                widget.onChanged(counter);
              });
            },
          ),
          Text(
            '$counter',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.tealAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if (counter < widget.maxValue) {
                  counter++;
                }
                widget.onChanged(counter);
              });
            },
          ),
        ],
      ),
    );
  }
}
