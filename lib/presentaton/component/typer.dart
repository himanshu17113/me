import 'dart:async';
import 'package:flutter/material.dart';

/// A widget that displays text with a typing animation effect.
///
/// The `TypeText` widget animates the appearance of the given [text]
/// character by character, simulating a typing effect. It offers customization
/// for typing speed, cursor display, and standard text styling properties.
///
/// Example usage:
///
/// ```dart
/// TypeText(
///   'Hello, Flutter!',
///   duration: const Duration(seconds: 3),
///   style: const TextStyle(fontSize: 24),
///   typingSpeed: 50, // characters per second
///   cursor: '_',
///   cursorBlinkRate: 500, // milliseconds
/// )
/// ```
class TypeText extends StatefulWidget {
  /// Creates a `TypeText` widget.
  const TypeText(
    this.text, {
    super.key,
    this.duration,
    this.typingSpeed,
    this.msPerCharacter,
    this.onType,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.delayBeforeStart = Duration.zero,
  })  : assert(
          duration == null || typingSpeed == null && msPerCharacter == null,
          'Provide either duration or typingSpeed/msPerCharacter, but not both duration and typingSpeed/msPerCharacter.',
        ),
        assert(
          typingSpeed == null || msPerCharacter == null,
          'Provide either typingSpeed or msPerCharacter, but not both.',
        ),
        assert(
          typingSpeed == null || typingSpeed > 0,
          'typingSpeed must be greater than 0 if provided.',
        ),
        assert(
          msPerCharacter == null || msPerCharacter > 0,
          'msPerCharacter must be greater than 0 if provided.',
        );

  /// The text to be displayed with the typing effect.
  final String text;

  /// Callback function called for every character typed.
  /// Provides the typing progress as a double between 0.0 and 1.0.
  final ValueChanged<double>? onType;

  /// Total duration for the typing animation.
  ///
  /// If provided, the typing speed will be calculated based on the text length
  /// to fit within this duration. Cannot be used with [typingSpeed] or [msPerCharacter].
  final Duration? duration;

  /// Typing speed in characters per second.
  ///
  /// If provided, the typing animation will proceed at this speed.
  /// Cannot be used with [duration].
  final double? typingSpeed;

  /// Milliseconds per character for typing animation.
  ///
  /// If provided, the typing animation will take this many milliseconds for each character.
  /// Cannot be used with [duration].
  final int? msPerCharacter;

  /// Delay before the typing animation starts.
  final Duration delayBeforeStart;

  /// The style to be applied to the text.
  final TextStyle? style;

  /// {@macro flutter.painting.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.painting.textAlign}
  final TextAlign? textAlign;

  /// {@macro flutter.painting.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.dart_ui.locale}
  final Locale? locale;

  /// {@macro flutter.painting.textPainter.softWrap}
  final bool? softWrap;

  /// {@macro flutter.painting.textPainter.overflow}
  final TextOverflow? overflow;

  /// {@macro flutter.dart_ui.textScaleFactor}
  final double? textScaleFactor;

  /// {@macro flutter.painting.textPainter.maxLines}
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.semanticsLabel}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro flutter.painting.textPainter.textHeightBehavior}
  final TextHeightBehavior? textHeightBehavior;

  @override
  TypeTextState createState() => TypeTextState();
}

class TypeTextState extends State<TypeText> {
  String _typedText = "";
  Timer? _timer;
  int _currentIdx = 0;
  late List<String> _textCharacters;
  late int _msPerCharCalculated;

  @override
  void initState() {
    super.initState();
    _textCharacters = widget.text.characters.toList();
    _calculateMsPerChar();

    _startTyping();
  }

  void _calculateMsPerChar() {
    if (widget.msPerCharacter != null) {
      _msPerCharCalculated = widget.msPerCharacter!;
    } else if (widget.typingSpeed != null) {
      _msPerCharCalculated = (1000 / widget.typingSpeed!).round();
    } else if (widget.duration != null) {
      if (widget.duration == Duration.zero) {
        _msPerCharCalculated = 1; // Minimal duration for each character
      } else {
        _msPerCharCalculated = (widget.duration!.inMilliseconds / _textCharacters.length).ceil();
        _msPerCharCalculated = _msPerCharCalculated > 0 ? _msPerCharCalculated : 1; // Ensure at least 1ms
      }
    } else {
      _msPerCharCalculated = 50; // Default speed if no duration or speed is provided.
    }
  }

  void _startTyping() {
    if (widget.delayBeforeStart > Duration.zero) {
      Future.delayed(widget.delayBeforeStart, _restartTimer);
    } else {
      _restartTimer();
    }
  }

  void _restartTimer() {
    _stopTimer();
    _typedText = "";
    _currentIdx = 0;

    if (_textCharacters.isEmpty) {
      widget.onType?.call(1);

      return;
    }

    _timer = Timer.periodic(
      Duration(milliseconds: _msPerCharCalculated),
      _typeNextCharacter,
    );
  }

  void _typeNextCharacter(Timer timer) {
    if (_currentIdx < _textCharacters.length) {
      final String nextChar = _textCharacters[_currentIdx];
      setState(() {
        _typedText += nextChar;
        _currentIdx++;
      });
      widget.onType?.call(_currentIdx / _textCharacters.length);
    } else {
      _stopTimer();
      widget.onType?.call(1);
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void didUpdateWidget(TypeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.style != widget.style) {
      setState(() {});
    }

    if (oldWidget.duration != widget.duration ||
        oldWidget.typingSpeed != widget.typingSpeed ||
        oldWidget.msPerCharacter != widget.msPerCharacter ||
        oldWidget.delayBeforeStart != widget.delayBeforeStart ||
        oldWidget.text != widget.text) {
      if (widget.text == "") {
        setState(() => _typedText = "");
      } else {
        _textCharacters = widget.text.characters.toList();
        _calculateMsPerChar();

        _startTyping();
      }
    }
  }

  @override
  void dispose() {
    _stopTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = _typedText;

    return Text(
      displayText,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
    );
  }
}
