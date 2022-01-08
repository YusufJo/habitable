part of 'responsive_app.dart';

class ResponsiveSizer extends InheritedWidget {
  static const _uiArtBoardHeight = 896;
  static const _uiArtBoardWidth = 414;

  const ResponsiveSizer._({
    Key? key,
    required Widget child,
    required this.constraints,
    required this.orientation,
  }) : super(key: key, child: child);

  final BoxConstraints constraints;
  final Orientation orientation;

  static ResponsiveSizer of(BuildContext context) {
    final ResponsiveSizer? result =
        context.dependOnInheritedWidgetOfExactType<ResponsiveSizer>();
    assert(result != null, 'No _ResponsiveSizer2 found in context');
    return result!;
  }

  EdgeInsets get _normalizedSafeArea {
    final safeArea = WidgetsBinding.instance!.window.padding;
    final pixelRatio = WidgetsBinding.instance!.window.devicePixelRatio;
    return EdgeInsets.fromLTRB(
        safeArea.left / pixelRatio,
        safeArea.top / pixelRatio,
        safeArea.right / pixelRatio,
        safeArea.bottom / pixelRatio);
  }

  double get deviceHeight => constraints.maxHeight;

  double get deviceSafeHeight {
    return deviceHeight - _normalizedSafeArea.vertical;
  }

  @override
  bool updateShouldNotify(ResponsiveSizer oldWidget) => oldWidget != this;

  double width(double defaultWidth) {
    final defaultWidthPercentage = defaultWidth / _uiArtBoardWidth;
    return constraints.maxWidth * defaultWidthPercentage;
  }

  double widthOrDefault(double defaultWidth) {
    final responsiveWidth = width(defaultWidth);
    return responsiveWidth < defaultWidth ? responsiveWidth : defaultWidth;
  }

  double height(double defaultHeight) {
    final defaultHeightPercentage = defaultHeight / _uiArtBoardHeight;
    return deviceSafeHeight * defaultHeightPercentage;
  }

  double heightOrDefault(double defaultHeight) {
    final responsiveHeight = height(defaultHeight);
    return responsiveHeight < defaultHeight ? responsiveHeight : defaultHeight;
  }

  double text(double defaultSize) {
    return heightOrDefault(defaultSize);
  }

  double radius(double defaultRadius) {
    final defaultRadiusPercentage = defaultRadius / _uiArtBoardHeight;
    return constraints.maxHeight * defaultRadiusPercentage;
  }

  double topSafePadding(double defaultPadding) {
    final computedPadding = height(defaultPadding);
    final safeArea = _normalizedSafeArea;
    return safeArea.top > computedPadding ? safeArea.top : computedPadding;
  }

  double bottomSafePadding(double defaultPadding) {
    final computedPadding = height(defaultPadding);
    final safeArea = _normalizedSafeArea;
    return safeArea.bottom > computedPadding
        ? safeArea.bottom
        : computedPadding;
  }
}
