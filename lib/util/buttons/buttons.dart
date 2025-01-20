import 'package:flutter/material.dart';
import 'package:me/util/extensions/extensions.dart';
import '../constant_colors.dart';
import '../constant_sizes.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    super.key,
    required this.label,
    this.bgColor = kWhite,
    this.foregroundColor = kBlack,
    this.shadowColor,
    required this.onPressed,
    this.icon,
  });
  final String label;
  final Color bgColor;
  final Color foregroundColor;
  final Color? shadowColor;
  final VoidCallback onPressed;
  final IconData? icon;
  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.adaptive(Theme.of(context).textTheme.bodySmall, Theme.of(context).textTheme.bodyMedium);
    return GestureDetector(
        onTap: widget.onPressed,
        child: MouseRegion(
            onHover: (PointerEvent event) {
              setState(() {
                _isHovered = true;
              });
            },
            onExit: (PointerEvent event) {
              setState(() {
                _isHovered = false;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  right: _isHovered ? s0 : s8,
                  top: _isHovered ? s0 : s8,
                  duration: Durations.medium4,
                  child: Container(
                      foregroundDecoration: ShapeDecoration(
                          shape: StadiumBorder(), color: Theme.of(context).colorScheme.secondaryContainer),
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            widget.label,
                            style: labelStyle,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: OutlinedButton(
                      onPressed: widget.onPressed,
                      child: Text(
                        widget.label,
                        style: labelStyle,
                      )),
                ),
              ],
            )));
  }
}
