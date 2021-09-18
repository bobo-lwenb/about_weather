import 'package:about_weather/main_ui/sign_banner/sign_mode.dart';
import 'package:about_weather/tool_box/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class RRectangleBorder extends StatelessWidget {
  final Widget child;
  final bool isPadding;
  final bool isMargin;
  final bool halfRightMargin;
  final bool halfLeftMargin;
  final SignMode mode;

  const RRectangleBorder({
    Key? key,
    this.mode = SignMode.normal,
    this.isPadding = false,
    this.isMargin = true,
    this.halfRightMargin = false,
    this.halfLeftMargin = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      padding: isPadding ? const EdgeInsets.all(16) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: mode == SignMode.normal
                ? Colors.white24
                : isDark(context)
                    ? Colors.white24
                    : Colors.black),
      ),
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
