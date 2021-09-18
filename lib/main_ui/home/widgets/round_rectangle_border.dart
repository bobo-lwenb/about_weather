import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';

class RRectangleBorder extends StatelessWidget {
  final bool isPadding;
  final bool isMargin;
  final bool halfRightMargin;
  final bool halfLeftMargin;
  final bool followTheme;
  final Widget child;

  const RRectangleBorder({
    Key? key,
    this.isPadding = false,
    this.isMargin = true,
    this.halfRightMargin = false,
    this.halfLeftMargin = false,
    this.followTheme = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      padding: isPadding ? const EdgeInsets.all(16) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: !followTheme
                ? Colors.white24
                : isDark(context)
                    ? Colors.white24
                    : Colors.black),
      ),
      child: child,
    );
    Widget temp = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: container,
    );
    Widget border = isMargin
        ? Padding(
            padding: EdgeInsets.only(
              left: halfLeftMargin ? 8 : 16,
              top: 16,
              right: halfRightMargin ? 8 : 16,
            ),
            child: temp,
          )
        : temp;
    return border;
  }
}
