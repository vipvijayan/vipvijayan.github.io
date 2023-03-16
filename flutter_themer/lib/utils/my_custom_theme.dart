import 'package:flutter_themer/utils/exports.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  //
  const MyColors({
    required this.success,
  });

  final Color? success;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? listTitleColor,
  }) {
    return MyColors(
      success: listTitleColor ?? this.success,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      success: Color.lerp(
        success,
        other.success,
        t,
      ),
    );
  }

  @override
  String toString() {
    return 'MyColors(success: $success)';
  }

  static var light = const MyColors(
    success: Colors.green,
  );

  static var dark = const MyColors(
    success: Colors.green,
  );
}
