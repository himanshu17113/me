import 'package:flutter/material.dart';

class FocusNodeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, bool hasFocus) builder;
  final FocusNode focusNode;
  const FocusNodeBuilder({super.key, required this.builder, required this.focusNode});

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
  Widget build(BuildContext context) {
    return widget.builder(context, hasFocus);
  }
}
