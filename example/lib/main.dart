import 'package:alphabet_slider/alphabet_slider.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphabetSlider Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  /// Callback function when a letter is selected in the AlphabetSlider.
  void _onLetterSelect(letter) {
    final scrollToIndex = scrollToIndexMap[letter];
    if (scrollToIndex != null) {
      itemScrollController.jumpTo(index: scrollToIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
            child: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
              physics: const BouncingScrollPhysics(),
              itemCount: 43,
              itemBuilder: _getScrollItemBuilder,
            ),
          ),
          AlphabetSlider(
            onLetterSelect: _onLetterSelect,
            textColor: Colors.green,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}

/// Builds the list item for the contact at [index].
Widget _getScrollItemBuilder(BuildContext context, int index) {
  final contact = sortedContacts[index];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          contact['name'] ?? '',
          style: const TextStyle(color: Colors.green),
        ),
      ),
      const Divider(
        thickness: 1,
        color: Colors.grey,
        height: 0,
      )
    ],
  );
}
