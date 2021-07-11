import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final List<double> cellRatio;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  final String title6;

  ListHeader({
    required this.cellRatio,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.title6,
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
        TableRow(
          children: <Widget>[
            HeaderCell(
              title: title1,
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              color: Colors.black87,
              backgroundColor: Colors.blue[300]!,
            ),
            HeaderCell(
              title: title2,
              color: Colors.red,
              backgroundColor: Colors.red[50]!,
            ),
            HeaderCell(
              title: title3,
              color: Colors.orange,
              backgroundColor: Colors.orange[50]!,
            ),
            HeaderCell(
              title: title4,
              color: Colors.purple,
              backgroundColor: Colors.purple[50]!,
            ),
            HeaderCell(
              title: title5,
              color: Colors.black87,
              backgroundColor: Colors.grey[500]!,
            ),
            HeaderCell(
              title: title6,
              color: Colors.green,
              backgroundColor: Colors.green[50]!,
            ),
          ],
        ),
      ],
    );
    return table;
  }
}

class HeaderCell extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Color color;
  final Color backgroundColor;

  HeaderCell({
    required this.title,
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    required this.color,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      height: 50,
      padding: padding,
      color: backgroundColor,
      child: Align(
        alignment: alignment,
        child: Text(
          "$title",
          style: TextStyle(color: color),
        ),
      ),
    );
    return container;
  }
}
