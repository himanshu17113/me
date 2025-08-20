import 'package:flutter/material.dart';
import '../../typo.dart';

class HoveLink extends StatelessWidget {
  HoveLink({
    required this.label, required this.onPressed, super.key,
  });

  final String label;
  final VoidCallback onPressed;

  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  void _onHover(bool isHovered) {
    _isHovered.value = isHovered;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      builder: (_, hover, __) => MouseRegion(
          onEnter: (_) => _onHover(true),
          onHover: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
              onTap: onPressed,
              child: Text(label,
                  style: textStyle(
                    fontSize: 24,
                    letterSpacing: 0,
                    height: 1.33,
                    decoration: TextDecoration.underline,
                    fontFamily: "SourGummy",
                    decorationThickness: hover ? 2.4 : 2,
                    decorationColor: hover ? Theme.of(context).highlightColor : Theme.of(context).splashColor,
                  ))),
        ),
      valueListenable: _isHovered,
    );
}
