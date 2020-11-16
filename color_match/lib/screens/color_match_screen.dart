import 'package:flutter/material.dart';

import '../screens/palette_screen.dart';

class ColorMatchScreen extends StatefulWidget {
  @override
  _ColorMatchScreenState createState() => _ColorMatchScreenState();
}

class _ColorMatchScreenState extends State<ColorMatchScreen> {
  String _sampleText;
  bool _isBold;
  Color _foregroundColor, _backgroundColor;

  TextEditingController _controller;

  @override
  void initState() {
    _sampleText = "Sample Text";
    _isBold = false;
    _foregroundColor = Colors.black;
    _backgroundColor = Colors.yellow;
    _controller = TextEditingController(
      text: _sampleText,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // to avoid memory leaks
    super.dispose();
  }

  void setSampleText([String _]) {
    setState(() {
      _sampleText = _controller.text;
    });
  }

  Row _buildTextEditor() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: setSampleText,
          ),
        ),
        SizedBox(width: 10),
        RaisedButton(
          child: Text('Set Text'),
          onPressed: setSampleText,
        ),
      ],
    );
  }

  Widget _buildBoldEditor() {
    return Row(
      children: [
        Checkbox(
          value: _isBold,
          onChanged: (bool newValue) {
            setState(() {
              _isBold = newValue;
            });
          },
        ),
        SizedBox(width: 8),
        Text("Bold"),
      ],
    );
  }

  Widget _buildColorEditor({
    @required String buttonText,
    @required Color color,
    @required Function(Color) setStateFunc,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(color.value.toRadixString(16)),
        RaisedButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (_) => PaletteScreen(),
              ),
            )
                .then((chosenColor) {
              if (chosenColor != null) {
                setState(() {
                  setStateFunc(chosenColor);
                });
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Match')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: _backgroundColor,
              child: Center(
                child: Text(
                  _sampleText,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
                    color: _foregroundColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildTextEditor(),
                  SizedBox(height: 10),
                  _buildBoldEditor(),
                  SizedBox(height: 10),
                  _buildColorEditor(
                    buttonText: 'Foreground',
                    color: _foregroundColor,
                    setStateFunc: (color) => _foregroundColor = color,
                  ),
                  SizedBox(height: 10),
                  _buildColorEditor(
                    buttonText: 'Background',
                    color: _backgroundColor,
                    setStateFunc: (color) => _backgroundColor = color,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
