import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.brown,
  Colors.green,
  Colors.redAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  })  : assert(selectedColor >= 0, "The selected color must be greater than 1"),
        assert(selectedColor < colorList.length,
            "Selected color must be between 0 and ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));

  // AppTheme copyWith({
  //   int? selectedColor,
  //   bool? isDarkmode,
  // }) =>
  //     AppTheme(
  //       selectedColor: selectedColor ?? this.selectedColor,
  //       isDarkmode: isDarkmode ?? this.isDarkmode,
  //     );
}
