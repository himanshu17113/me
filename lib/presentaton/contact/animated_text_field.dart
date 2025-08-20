import 'package:flutter/material.dart';
import '../../const.dart';
import '../../typo.dart';

import 'focus_builder.dart';

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    required this.hintText,
    required this.node,
    super.key,
    this.textController,
    this.width,
    this.isMultiline = false,
    this.isEmail = false,
    this.hasFocus = false,
  });
  final double? width;
  final TextEditingController? textController;
  final String hintText;
  final bool isMultiline;
  final bool isEmail;
  final FocusNode node;
  final bool hasFocus;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Column(children: <Widget>[
          TextField(
            focusNode: node,
            keyboardType: isMultiline
                ? TextInputType.multiline
                : isEmail
                    ? TextInputType.emailAddress
                    : TextInputType.text,
            controller: textController,
            onSubmitted: (String text) {},
            maxLines: isMultiline ? null : 1,
            textAlign: TextAlign.center,
            cursorColor: theme.colorScheme.secondary.withAlpha(200),
            cursorOpacityAnimates: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textStyle(fontSize: 28, color: theme.colorScheme.secondary.withAlpha(50), fontFamily: "SourGummy"),
              isCollapsed: true,
              filled: true,
              hoverColor: theme.colorScheme.secondary.withAlpha(25),
              fillColor: const Color.fromARGB(1, 0, 0, 0), //theme.colorScheme.secondary.withAlpha(100),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                borderSide: BorderSide.none,
              ),
              focusColor: theme.colorScheme.secondary.withAlpha(100),
            ),
          ),
          AnimatedUnderline(
            node: node,
            width: width ?? double.infinity,
          ),
        ]),
      );
}

class AnimatedUnderline extends StatelessWidget {
  const AnimatedUnderline({
    required this.width,
    required this.node,
    super.key,
  });
  final FocusNode node;
  final double width;

  @override
  Widget build(BuildContext context) => Stack(children: <Widget>[
        Container(
          height: 2,
          width: width,
          color: theme.colorScheme.secondary.withAlpha(35),
        ),
        FocusNodeBuilder(
          builder: (BuildContext context, bool hasFocus) => AnimatedContainer(
            duration: Durations.long2,
            height: 2,
            width: hasFocus ? width : 0,
            color: theme.colorScheme.secondary,
          ),
          focusNode: node,
        )
      ]);
}
