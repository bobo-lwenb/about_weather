import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final Widget leading;
  final Widget leadingTitle;
  final Widget trailing;
  final Widget trailingTitle;
  final Widget subTitle;

  ItemTile({
    this.leading,
    @required this.leadingTitle,
    this.trailing = const Icon(Icons.keyboard_arrow_right_rounded),
    this.trailingTitle,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    Widget _leading = leading == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(left: 10),
            child: leading,
          );
    Widget _leadingTitle = Expanded(
      child: leadingTitle == null
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: leadingTitle,
            ),
    );
    Widget _trailingTitle = trailingTitle == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(left: 10),
            child: trailingTitle,
          );
    Widget _trailing = trailing == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(right: 10),
            child: trailing,
          );
    double _subTitleLeftPadding = IconTheme.of(context).size + 10 + 10;
    Widget _subTitle = subTitle == null
        ? const SizedBox()
        : Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: _subTitleLeftPadding, top: 5, right: 10, bottom: 5),
              child: subTitle,
            ),
          );
    Column _column = Column(
      children: [
        const Divider(height: 0),
        Container(
          height: 44,
          child: Row(
            children: [
              _leading,
              _leadingTitle,
              _trailingTitle,
              _trailing,
            ],
          ),
        ),
        const Divider(height: 0),
        _subTitle,
      ],
    );
    return Listener(
      onPointerDown: (event) {},
      child: _column,
    );
  }
}
