import 'package:flutter/material.dart';
import 'package:me/typo.dart';
import 'package:me/util/extensions/layout_adapter_ex.dart';

class HoveLink extends StatelessWidget {
  HoveLink({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  void _onHover(bool isHovered) {
    _isHovered.value = isHovered;
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.adaptive(titleBig, headlineMedium, sm: titleLarge, md: headlineSmall, xl: headlineLarge);
    return ValueListenableBuilder(
      builder: (_, hover, __) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onHover: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
              onTap: onPressed,
              child: Text(label,
                  style: labelStyle.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w100,
                    fontVariations: <FontVariation>[FontVariation('wght', 400.0)],
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
