library alphabet_slider;

import 'package:alphabet_slider/alphabet_slider_view.dart';
import 'package:flutter/material.dart';

/// AlphabetSlider
class AlphabetSlider extends StatelessWidget {
  /// Constructor
  const AlphabetSlider({
    super.key,
    required this.onLetterSelect,
    this.fontSize = 10,
    this.textColor = Colors.green,
    this.selectedTextColor = Colors.black,
    this.verticalLetterPadding = 2,
  });

  /// Callback for selecting a letter
  final Function(String letter) onLetterSelect;

  /// alphabet color
  final Color textColor;

  /// selected alphabet color
  final Color selectedTextColor;

  /// vertical padding
  final double verticalLetterPadding;

  /// alphabet font size
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AlphabetSliderView(
      selectLetterCallBack: onLetterSelect,
      selectedTextColor: selectedTextColor,
      textColor: textColor,
      verticalLetterPadding: verticalLetterPadding,
      fontSize: fontSize,
    );
  }
}
