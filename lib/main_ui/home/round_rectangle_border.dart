import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class RRectangleBorder extends StatelessWidget {
  final Widget child;
  final bool isPadding;
  final bool isMargin;

  const RRectangleBorder({
    Key? key,
    this.isPadding = false,
    this.isMargin = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      padding: isPadding ? const EdgeInsets.all(16) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white24)),
      child: child,
    );
    Widget temp = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: container,
      ),
    );
    Widget border = isMargin
        ? Padding(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: temp,
          )
        : temp;
    return border;
  }
}
