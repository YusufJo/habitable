import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive/responsive_app.dart';

class IconTextField extends StatefulWidget {
  final String svgIconPath;
  final InputDecoration? decoration;
  final bool? obscureText;
  final Color? fillColor;
  final TextInputType? textInputType;

  const IconTextField(
      {Key? key,
      required this.svgIconPath,
      this.decoration,
      this.obscureText,
      this.fillColor,
      this.textInputType})
      : super(key: key);

  @override
  State<IconTextField> createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  late final FocusNode focusNode;
  late final ValueNotifier<bool> hasFocus;
  late final ValueNotifier<bool> isObscured;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    hasFocus = ValueNotifier(focusNode.hasFocus);
    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);

    isObscured = ValueNotifier(widget.obscureText ?? false);
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    final themeData = Theme.of(context);
    final radiusAmount = responsiveSizer.radius(12);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: responsiveSizer.widthOrDefault(50),
            decoration: BoxDecoration(
              color: widget.fillColor ?? themeData.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radiusAmount),
                bottomLeft: Radius.circular(radiusAmount),
              ),
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: hasFocus,
              builder: (_, newValue, __) =>
                  _Icon(svgIconPath: widget.svgIconPath, hasFocus: newValue),
            ),
          ),
          VerticalDivider(
            width: 2,
            thickness: 2,
            color: themeData.colorScheme.secondary.withOpacity(0.2),
          ),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: isObscured,
              builder: (_, newValue, __) => TextField(
                keyboardType: widget.textInputType,
                scrollPadding: EdgeInsets.only(
                  top: responsiveSizer.topSafePadding(50),
                  bottom: responsiveSizer.bottomSafePadding(50),
                ),
                obscureText: newValue,
                focusNode: focusNode,
                decoration: widget.decoration != null
                    ? widget.decoration!.copyWith(
                        border: _outlinedInputBorder(radiusAmount),
                        fillColor: widget.fillColor)
                    : InputDecoration(
                        border: _outlinedInputBorder(radiusAmount),
                        fillColor: widget.fillColor),
              ),
            ),
          ),
          if (widget.obscureText == true)
            _ShowPasswordButton(
              fillColor: widget.fillColor,
              borderRadius: _rightRoundedBorderRadius(radiusAmount),
              onTapDown: () => isObscured.value = false,
              onTapUp: () => isObscured.value = true,
            ),
        ],
      ),
    );
  }

  OutlineInputBorder _outlinedInputBorder(double radiusAmount) {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: widget.obscureText == null || widget.obscureText == false
          ? _rightRoundedBorderRadius(radiusAmount)
          : const BorderRadius.all(
              Radius.zero,
            ),
    );
  }

  BorderRadius _rightRoundedBorderRadius(double radiusAmount) {
    return BorderRadius.only(
      topLeft: Radius.zero,
      bottomLeft: Radius.zero,
      topRight: Radius.circular(radiusAmount),
      bottomRight: Radius.circular(radiusAmount),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    hasFocus.dispose();
    isObscured.dispose();
    super.dispose();
  }
}

class _ShowPasswordButton extends StatelessWidget {
  final Color? fillColor;
  final BorderRadius borderRadius;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;

  const _ShowPasswordButton({
    Key? key,
    required this.borderRadius,
    required this.onTapDown,
    required this.onTapUp,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    return GestureDetector(
      onTapDown: (_) => onTapDown(),
      onTapUp: (_) => onTapUp(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: responsiveSizer.width(20)),
        decoration: BoxDecoration(
          color: fillColor ?? Theme.of(context).scaffoldBackgroundColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          'Show',
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: responsiveSizer.text(14),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _Icon extends StatefulWidget {
  const _Icon({
    Key? key,
    required this.hasFocus,
    required this.svgIconPath,
  }) : super(key: key);

  final bool hasFocus;
  final String svgIconPath;

  @override
  State<_Icon> createState() => _IconState();
}

class _IconState extends State<_Icon> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSizer = ResponsiveSizer.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final colorTween = ColorTween(
      begin: colorScheme.primary.withOpacity(0.5),
      end: colorScheme.secondary,
    ).animate(animationController);

    widget.hasFocus
        ? animationController.forward()
        : animationController.reverse();

    return AnimatedBuilder(
      animation: colorTween,
      builder: (_, __) => SvgPicture.asset(
        widget.svgIconPath,
        fit: BoxFit.scaleDown,
        width: responsiveSizer.width(16),
        height: responsiveSizer.height(16),
        color: colorTween.value,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
