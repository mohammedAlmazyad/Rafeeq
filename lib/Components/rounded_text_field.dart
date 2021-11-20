import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterweekend/constants/app_colors.dart';
import 'package:flutterweekend/constants/validation.dart';
import '../components/titled.dart';
import 'dart:ui';

// import 'package:uni_haraj/constants/decorations.dart';
// import 'package:uni_haraj/constants/validation.dart';

class RoundedTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final String? label;
  final Color? fillColor;
  final bool? isBordered;
  final bool? enabled;
  final bool? center;
  final bool? obscureText;
  final double? fontSize;
  final bool? clearButton;
  final TextEditingController? textController;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle;
  final TextDirection? textDirection;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final double? height;
  final int? maxLines;
  final Function? onSubmitted;
  final int? maxLength;
  final bool? isNumber;
  const RoundedTextField({
    Key? key,
    this.title,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.margin,
    this.label,
    this.fillColor,
    this.isBordered = false,
    this.textController,
    this.fontSize,
    this.enabled,
    this.padding,
    this.obscureText = false,
    this.clearButton = true,
    this.center = false,
    this.hintStyle,
    this.textDirection,
    this.textCapitalization,
    this.focusNode,
    this.height,
    this.maxLines = 1,
    this.onSubmitted,
    this.maxLength,
    this.isNumber = false,
  });

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  late TextEditingController _textController;
  bool hidePassword = false;
  bool showClear = true;

  @override
  void initState() {
    _textController = widget.textController ?? TextEditingController();
    if (widget.clearButton! || widget.obscureText!) {
      hidePassword = widget.obscureText! ? true : false;
    }
    super.initState();
  }

  @override
  void dispose() {
    _textController.removeListener(() {
      setState(() {});
    });
    if (_textController != null) _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.symmetric(vertical: 5),
      child: Titled(
        title: widget.title,
        child: Container(
          height: widget.height ?? kCardHeight,
          child: TextField(
            onSubmitted: (string) {
              widget.onSubmitted;
            },
            onTap: () => _textController.selection =
                TextSelection.fromPosition(TextPosition(offset: _textController.text.length)),
            enabled: widget.enabled,
            maxLines: widget.obscureText! ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            controller: _textController,
            obscureText: widget.obscureText! ? hidePassword : false,
            textAlign: widget.center! ? TextAlign.center : TextAlign.start,
            textDirection: widget.textDirection,
            style: TextStyle(color: kPrimaryColor, fontSize: widget.fontSize ?? 14, height: 1.1),
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
            inputFormatters: widget.isNumber!
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ]
                : null,
            decoration: InputDecoration(
              counterText: '',
              suffixIconConstraints:
                  widget.clearButton! || widget.obscureText! ? BoxConstraints.tightFor(height: 40, width: 40) : null,
              suffixIcon: widget.clearButton! || widget.obscureText!
                  ? AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: safeIsNotEmpty(_textController.text) ? 1 : 0,
                      child: InkWell(
                        onTap: () => setState(() {
                          safeIsNotEmpty(_textController.text)
                              ? widget.obscureText!
                                  ? hidePassword = !hidePassword
                                  : _textController.clear()
                              : null;
                          widget.onChanged!(_textController.text ?? '');
                        }),
                        child: Icon(
                          widget.obscureText! ? CupertinoIcons.eye_solid : CupertinoIcons.clear_circled_solid,
                          color: kDark4,
                          size: widget.obscureText! ? 25 : 20,
                        ),
                      ),
                    )
                  : null,
              fillColor: widget.fillColor ?? kLight2,
              filled: widget.isBordered! ? false : true,
              labelText: widget.label,
              contentPadding:
                  widget.padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: widget.maxLines != null ? 15 : 0),
              focusedBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: kBlueColor.withOpacity(0.5)),
                borderRadius: kBorderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: widget.isBordered! ? kBlueColor.withOpacity(0.5) : kTransparent),
                borderRadius: kBorderRadius,
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: widget.isBordered! ? kBlueColor.withOpacity(0.5) : kTransparent),
                borderRadius: kBorderRadius,
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(color: kGrey3, fontSize: widget.fontSize ?? 14),
            ),
            onChanged: (value) {
              widget.onChanged!(value);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
