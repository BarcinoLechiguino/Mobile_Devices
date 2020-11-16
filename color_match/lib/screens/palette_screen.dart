import '../colors.dart';
import 'package:flutter/material.dart';

class PaletteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose a Color...')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: colorList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop(colorList[index]);
            },
            child: Container(
              color: colorList[index],
            ),
          );
        },
      ),
    );
  }
}
