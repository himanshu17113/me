import 'package:flutter/material.dart';

class FocusNodeBuilder extends StatefulWidget {
  const FocusNodeBuilder({required this.builder, required this.focusNode, super.key});
  final Widget Function(BuildContext context, bool hasFocus) builder;
  final FocusNode focusNode;

  @override
  State<FocusNodeBuilder> createState() => _FocusNodeBuilderState();
}

class _FocusNodeBuilderState extends State<FocusNodeBuilder> {
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    hasFocus = widget.focusNode.hasFocus;
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {
        hasFocus = widget.focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, hasFocus);
}
