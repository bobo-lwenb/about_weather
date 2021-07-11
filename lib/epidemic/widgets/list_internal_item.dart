import 'package:flutter/material.dart';

class ListiternalItem extends StatelessWidget {
  final List<double> cellRatio;
  final String areaName;
  final int nowConfirm;
  final int nowConfirmAdd;
  final int confirm;
  final int confirmAdd;
  final int local;
  final int localAdd;
  final int dead;
  final int deadAdd;

  ListiternalItem({
    required this.cellRatio,
    required this.areaName,
    required this.nowConfirm,
    required this.nowConfirmAdd,
    required this.confirm,
    required this.confirmAdd,
    required this.local,
    required this.localAdd,
    required this.dead,
    required this.deadAdd,
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
            Container(
              height: 30,
              padding: const EdgeInsets.only(left: 8, bottom: 3),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  areaName,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildTopText(value: nowConfirm),
            _buildTopText(value: confirm),
            _buildTopText(value: local),
            _buildTopText(value: dead),
            Container(
              height: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(),
            _buildBottomText(value: nowConfirmAdd),
            _buildBottomText(value: confirmAdd),
            _buildBottomText(value: localAdd, build: false),
            _buildBottomText(value: deadAdd),
            Container(),
          ],
        ),
      ],
    );
    return table;
  }

  Widget _buildTopText({int value = 0}) {
    return Container(
      height: 30,
      padding: const EdgeInsets.only(bottom: 3),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "$value",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBottomText({int? value, bool build = true}) {
    if (value == null) return Container(height: 27);
    if (value == 0 && !build) return Container(height: 27);
    return Container(
      height: 27,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "较昨日${_buildString(value)}",
          style: TextStyle(color: Colors.grey[500], fontSize: 14),
        ),
      ),
    );
  }

  String _buildString(int change) {
    if (change >= 0) {
      return "+${change.abs()}";
    } else if (change < 0) {
      return "-${change.abs()}";
    } else {
      return "$change";
    }
  }
}
