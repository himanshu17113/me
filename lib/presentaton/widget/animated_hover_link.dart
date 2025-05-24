import 'package:flutter/material.dart';
import 'package:me/typo.dart';

class HoveLink extends StatelessWidget {
  HoveLink({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  void _onHover(bool isHovered) {
    _isHovered.value = isHovered;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (_, hover, __) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onHover: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
              onTap: onPressed,
              child: Text(label,
                  style: textStyle(
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    height: 1.33,
                    decoration: TextDecoration.underline,
               
                    wght: 400.0,
                    fontFamily: "SourGummy",
                    decorationThickness: hover ? 2.4 : 2,
                    decorationColor: hover ? Theme.of(context).highlightColor : Theme.of(context).splashColor,
                  ))),
        );
      },
      valueListenable: _isHovered,
    );
  }
}
