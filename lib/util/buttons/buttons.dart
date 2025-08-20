import 'package:flutter/material.dart';
import '../../typo.dart';
import '../constant_sizes.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.isRounded = true,
  });
  final String label;
  final bool isRounded;
  final VoidCallback onPressed;
  final IconData? icon;
  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = textStyle(
      fontSize: 18,
      //  fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.27,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            right: _isHovered ? s0 : s8,
            top: _isHovered ? s0 : s8,
            curve: Curves.easeIn,
            duration: Durations.medium4,
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  shape: widget.isRounded ? const StadiumBorder() : const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(.12))),
                ),
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
                ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8),
          child: OutlinedButton.icon(
              onHover: (value) => setState(() => _isHovered = value),
              iconAlignment: IconAlignment.end,
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1.5),
                  shape: widget.isRounded ? const StadiumBorder() : const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(.12))),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
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
