<?code-excerpt path-base="example"?>

# alphabet_slider

A Flutter plugin for an Alphabet slider, commonly used in phone contact listing pages. This package provides a widget that lists all the alphabets vertically. Users can select an alphabet by either sliding on top of the list or clicking on an alphabet.

## Usage

To use this plugin, add `alphabet_slider` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

### Example

<?code-excerpt "lib/basic.dart (basic-example)"?>
```dart
import 'package:flutter/material.dart';
import 'package:alphabet_slider/alphabet_slider.dart';

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: AlphabetSlider(onLetterSelect: _onLetterSelect),
        ),
      ),
    );

void _onLetterSelect(String letter) {
// Jump to contact starting with 'letter'
}
```

See the example app for more complex examples.

