import 'package:flutter_themer/utils/exports.dart';

class NumberTF extends StatelessWidget {
  const NumberTF({
    super.key,
    required this.initialValue,
    required this.onChange,
  });

  final String initialValue;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: propertyWidth - 30,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: (value) => onChange(value),
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
        ],
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
