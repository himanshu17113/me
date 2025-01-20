import 'package:flutter/material.dart';
import 'package:me/util/extensions/extensions.dart';
import '../constant_sizes.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });
  final String label;

  final VoidCallback onPressed;
  final IconData? icon;
  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.adaptive(
        Theme.of(context).textTheme.bodySmall, Theme.of(context).textTheme.headlineLarge,
        md: Theme.of(context).textTheme.titleMedium);
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            right: _isHovered ? s0 : s8,
            top: _isHovered ? s0 : s8,
            curve: Curves.easeIn,
            duration: Durations.medium4,
            child: AnimatedContainer(
              foregroundDecoration:
                  ShapeDecoration(shape: StadiumBorder(), color: Theme.of(context).colorScheme.secondaryContainer),
              duration: Durations.medium4,
              padding: EdgeInsets.symmetric(horizontal: _isHovered ? 30 : 20, vertical: 7.5),
              child: Row(
                children: [
                  Text(
                    widget.label,
                    style: labelStyle,
                  ),
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                    )
                  ],
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              onHover: (value) => setState(() {
                    _isHovered = value;
                  }),
              onPressed: widget.onPressed,
              child: AnimatedPadding(
                padding: EdgeInsets.symmetric(horizontal: (_isHovered ? 10 : 0)),
                duration: Durations.long1,
                child: Row(
                  children: [
                    Text(
                      widget.label,
                      style: labelStyle,
                    ),
                    if (widget.icon != null) ...[
                      SizedBox(width: 6),
                      Icon(
                        widget.icon,
                      )
                    ],
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
