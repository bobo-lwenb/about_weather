import 'package:flutter/material.dart';

class ListGlobalItem extends StatelessWidget {
  final List<double> cellRatio;
  final String value0;
  final String value1;
  final String value2;
  final String value3;
  final String value4;

  ListGlobalItem({
    this.cellRatio,
    this.value0,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 16;
    Widget table = Table(
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(width * cellRatio[0]),
        1: FixedColumnWidth(width * cellRatio[1]),
        2: FixedColumnWidth(width * cellRatio[2]),
        3: FixedColumnWidth(width * cellRatio[3]),
        4: FixedColumnWidth(width * cellRatio[4]),
        5: FixedColumnWidth(width * cellRatio[5]),
      },
      children: <TableRow>[
        TableRow(children: <Widget>[
          _buildText(text: value0, alignment: Alignment.centerLeft),
          _buildText(text: value1),
          _buildText(text: value2),
          _buildText(text: value3),
          _buildText(text: value4),
          Container(
            height: 55,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 18,
              ),
            ),
          ),
        ]),
      ],
    );
    return table;
  }

  Widget _buildText({
    String text,
    Color color = Colors.black,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    Widget container = Container(
      height: 55,
      child: Align(
        alignment: alignment,
        child: Text(
          "$text",
          style: TextStyle(color: color),
        ),
      ),
    );
    return container;
  }
}
