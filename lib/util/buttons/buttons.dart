import 'package:flutter/material.dart';
import 'package:me/util/extensions/extensions.dart';
import '../../typo.dart';
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
    final labelStyle = context.adaptive(titleSmall, titleMedium, md: titleBig, xl: titleLarge);
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            right: _isHovered ? s0 : s8,
            top: _isHovered ? s0 : s8,
            curve: Curves.easeIn,
            duration: Durations.medium4,
            child: Container(
              foregroundDecoration:
                  ShapeDecoration(shape: StadiumBorder(), color: Theme.of(context).colorScheme.secondaryContainer),
              child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
                  onPressed: widget.onPressed,
                  icon: widget.icon != null
                      ? AnimatedPadding(
                          padding: EdgeInsets.symmetric(horizontal: (_isHovered ? 4 : 0)),
                          duration: Durations.long1,
                          child: Icon(
                            widget.icon,
                          ))
                      : null,
                  label: Text(
                    widget.label,
                    style: labelStyle,
                  )),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8),
          child: OutlinedButton.icon(
              onHover: (value) => setState(() {
                    _isHovered = value;
                  }),
              iconAlignment: IconAlignment.end,
              style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
              onPressed: widget.onPressed,
              icon: widget.icon != null
                  ? AnimatedPadding(
                      padding: EdgeInsets.symmetric(horizontal: (_isHovered ? 4 : 0)),
                      duration: Durations.long1,
                      child: Icon(
                        widget.icon,
                      ))
                  : null,
              label: Text(
                widget.label,
                style: labelStyle,
              )),
        )
      ],
    );
  }
}
