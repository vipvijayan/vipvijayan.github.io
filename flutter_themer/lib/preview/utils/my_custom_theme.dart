import 'package:flutter_themer/exports/exports.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  //
  const MyColors({
    required this.listTitleColor,
  });

  final Color? listTitleColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? listTitleColor,
  }) {
    return MyColors(
      listTitleColor: listTitleColor ?? this.listTitleColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      listTitleColor: Color.lerp(
        listTitleColor,
        other.listTitleColor,
        t,
      ),
    );
  }

  @override
  String toString() {
    return 'MyColors(listTitleColor: $listTitleColor)';
  }

  static var light = const MyColors(
    listTitleColor: Colors.black,
  );

  static var dark = const MyColors(
    listTitleColor: Colors.white,
  );
}
