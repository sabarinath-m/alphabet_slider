library alphabet_slider;

import 'package:alphabet_slider/alphabet_slider_view.dart';
import 'package:flutter/material.dart';

class AlphabetSlider extends StatelessWidget {
  const AlphabetSlider({
    super.key,
    required this.onLetterSelect,
    this.fontSize = 10,
    this.textColor = Colors.green,
    this.selectedTextColor = Colors.black,
    this.verticalLetterPadding = 2,
  });
  final Function(String letter) onLetterSelect;
  final Color textColor;
  final Color selectedTextColor;
  final double verticalLetterPadding;
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
