class CustomColor {
  final int id;
  String name;
  String lightModeColorCode;
  String darkModeColorCode;
  CustomColor({
    required this.id,
    required this.name,
    this.lightModeColorCode = '#FF000000',
    this.darkModeColorCode = '#FFFFFFFF',
  });
}
