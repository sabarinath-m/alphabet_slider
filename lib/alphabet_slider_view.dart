import 'package:flutter/material.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

/// AlphabetSliderView Widget
class AlphabetSliderView extends StatefulWidget {
  /// Constructor
  const AlphabetSliderView({
    Key? key,
    required this.selectLetterCallBack,
    required this.fontSize,
    required this.textColor,
    required this.selectedTextColor,
    required this.verticalLetterPadding,
  }) : super(key: key);

  /// update currentSelectedLetter
  final void Function(String alphabet) selectLetterCallBack;

  /// alphabet color
  final Color textColor;

  /// selected alphabet color
  final Color selectedTextColor;

  /// vertical padding
  final double verticalLetterPadding;

  /// alphabet font size
  final double fontSize;

  @override
  State<AlphabetSliderView> createState() => _AlphabetSliderViewState();
}

class _AlphabetSliderViewState extends State<AlphabetSliderView> {
  final letters = List.generate(26, (index) => String.fromCharCode(index + 65))
    ..add('#');

  String currentSelectedLetter = '';

  /// Called on letter change
  void onLetterChange(
    String letter,
    void Function(String alphabet) letterChangeCallBack,
  ) {
    setState(() {
      currentSelectedLetter = letter;
    });
    letterChangeCallBack(letter);
  }

  /// Method called during drag event
  void onVerticalDragUpdate(
    BuildContext context,
    DragUpdateDetails dragUpdateDetails,
    void Function(String alphabet) selectLetter,
  ) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final height =
          renderBox.globalToLocal(dragUpdateDetails.globalPosition).dy;
      final letterHeight = widget.fontSize + 2 * (widget.verticalLetterPadding);

      var nextLetterIndex = (height / letterHeight).floor();

      /// If nextLetterIndex is not within the range of indexes,
      /// then based on overflow assign with max or min index of letters list
      if (nextLetterIndex > letters.length - 1) {
        nextLetterIndex = letters.length - 1;
      } else if (nextLetterIndex < 0) {
        nextLetterIndex = 0;
      }
      // Update currentSelectedLetter
      onLetterChange(letters[nextLetterIndex], selectLetter);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// LetterWidget
    Widget getLetterWidget(String letter, int index) {
      return GestureDetector(
        onTap: () => onLetterChange(letter, widget.selectLetterCallBack),
        child: Container(
          alignment: Alignment.center,
          child: Container(
            height: widget.fontSize + 2 * (widget.verticalLetterPadding),
            alignment: Alignment.center,
            child: Text(
              letter,
              style: TextStyle(
                color: currentSelectedLetter == letter
                    ? widget.selectedTextColor 
                    : widget.textColor,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onVerticalDragUpdate: (dragUpdateDetails) {
        onVerticalDragUpdate(
          context,
          dragUpdateDetails,
          widget.selectLetterCallBack,
        );
      },
      child: SizedBox(
        width: widget.fontSize + 10,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: letters.mapIndexed(getLetterWidget).toList(),
          ),
        ),
      ),
    );
  }
}
