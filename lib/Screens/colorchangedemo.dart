import 'dart:math';
import 'package:flutter/material.dart';

class TextInfo {
  final String text;
  final double fontSize;
  Color color;

  TextInfo(this.text, this.fontSize, this.color);
}

class ColorChangeDemo extends StatefulWidget {
  @override
  _ColorChangeDemoState createState() => _ColorChangeDemoState();
}

class _ColorChangeDemoState extends State<ColorChangeDemo> {
  List<List<TextInfo>> _textInfoList = [];

  @override
  void initState() {
    super.initState();
    _initializeTextInfoList();
    randomChange();
  }

  void _initializeTextInfoList() {
    // Define text information for each row
    _textInfoList = [
      [TextInfo("E", 50.0, Colors.black)],
      [TextInfo("P ", 45.0, Colors.black), TextInfo(" F", 45.0, Colors.black)],
      [
        TextInfo("T    ", 40.0, Colors.black),
        TextInfo("O   ", 40.0, Colors.black),
        TextInfo(" Z  ", 40.0, Colors.black),
        TextInfo(" S", 40.0, Colors.black)
      ],
      [
        TextInfo("  L  ", 35.0, Colors.black),
        TextInfo("   P  ", 35.0, Colors.black),
        TextInfo("  E  ", 35.0, Colors.black),
        TextInfo("  d ", 35.0, Colors.black),
      ],
      [
        TextInfo("P   ", 30.0, Colors.black),
        TextInfo(" E   ", 30.0, Colors.black),
        TextInfo(" D   ", 30.0, Colors.black),
        TextInfo(" F   ", 30.0, Colors.black),
        TextInfo(" C   ", 30.0, Colors.black),
      ],
      [
        TextInfo("E    ", 25.0, Colors.black),
        TextInfo("D    ", 25.0, Colors.black),
        TextInfo("F    ", 25.0, Colors.black),
        TextInfo("C    ", 25.0, Colors.black),
        TextInfo("O    ", 25.0, Colors.black),
        TextInfo("Z    ", 25, Colors.black)
      ],
      [
        TextInfo("E      ", 20.0, Colors.black),
        TextInfo("F      ", 20.0, Colors.black),
        TextInfo("L      ", 20.0, Colors.black),
        TextInfo("O      ", 20.0, Colors.black),
        TextInfo("P      ", 20.0, Colors.black),
        TextInfo("D      ", 20.0, Colors.black),
        TextInfo("Z      ", 20.0, Colors.black)
      ],
      [
        TextInfo("D      ", 15.0, Colors.black),
        TextInfo("F      ", 15.0, Colors.black),
        TextInfo("O      ", 15.0, Colors.black),
        TextInfo("E      ", 15.0, Colors.black),
        TextInfo("P      ", 15.0, Colors.black),
        TextInfo("C      ", 15.0, Colors.black),
        TextInfo("T      ", 15.0, Colors.black),
        TextInfo("E      ", 15.0, Colors.black)
      ],
      [
        TextInfo("L       ", 10.0, Colors.black),
        TextInfo("E       ", 10, Colors.black),
        TextInfo("D       ", 10.0, Colors.black),
        TextInfo("F       ", 10.0, Colors.black),
        TextInfo("O       ", 10.0, Colors.black),
        TextInfo("P       ", 10.0, Colors.black),
        TextInfo("C       ", 10.0, Colors.black),
        TextInfo("E       ", 10.0, Colors.black),
        TextInfo("T       ", 10.0, Colors.black)
      ],
      [
        TextInfo("F         ", 7.0, Colors.black),
        TextInfo("D         ", 7, Colors.black),
        TextInfo("P         ", 7.0, Colors.black),
        TextInfo("L         ", 7.0, Colors.black),
        TextInfo("T         ", 7.0, Colors.black),
        TextInfo("O         ", 7.0, Colors.black),
        TextInfo("E         ", 7.0, Colors.black),
        TextInfo("C         ", 7.0, Colors.black),
        TextInfo("D         ", 7.0, Colors.black)
      ],
      [
        TextInfo("P           ", 5.0, Colors.black),
        TextInfo("E       ", 5, Colors.black),
        TextInfo("S       ", 5.0, Colors.black),
        TextInfo("O       ", 5.0, Colors.black),
        TextInfo("L       ", 5.0, Colors.black),
        TextInfo("Z       ", 5.0, Colors.black),
        TextInfo("C       ", 5.0, Colors.black),
        TextInfo("F       ", 5.0, Colors.black),
        TextInfo("T       ", 5.0, Colors.black),
        TextInfo("D       ", 5.0, Colors.black)
      ],
    ];
  }

  void randomChange() {
    Random random = Random();
    int row = random.nextInt(_textInfoList.length);
    int col = random.nextInt(_textInfoList[row].length);

    // Reset color of all texts
    for (int i = 0; i < _textInfoList.length; i++) {
      for (int j = 0; j < _textInfoList[i].length; j++) {
        setState(() {
          _textInfoList[i][j].color = Colors.black;
        });
      }
    }

    // Set color of random text to red
    setState(() {
      _textInfoList[row][col].color = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _textInfoList.length,
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _textInfoList[row].length,
                (col) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    _textInfoList[row][col].text,
                    style: TextStyle(
                      fontSize: _textInfoList[row][col].fontSize,
                      color: _textInfoList[row][col].color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
