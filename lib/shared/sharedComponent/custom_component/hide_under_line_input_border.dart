import 'package:flutter/material.dart';

class HideUnderlineInputBorder extends InputBorder {
  const HideUnderlineInputBorder({
    super.borderSide = const BorderSide(),
    this.borderRadius = BorderRadius.zero,
  });

  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  HideUnderlineInputBorder copyWith(
      {BorderSide? borderSide, BorderRadius? borderRadius}) {
    return HideUnderlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.only(
        top: borderSide.width, left: borderSide.width, right: borderSide.width);
  }

  @override
  HideUnderlineInputBorder scale(double t) {
    return HideUnderlineInputBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paintInterior(Canvas canvas, Rect rect, Paint paint,
      {TextDirection? textDirection}) {
    canvas.drawRRect(borderRadius.resolve(textDirection).toRRect(rect), paint);
  }

  @override
  bool get preferPaintInterior => true;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is HideUnderlineInputBorder) {
      return HideUnderlineInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is HideUnderlineInputBorder) {
      return HideUnderlineInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  /// Draw a border on the top and sides of the [rect].
  ///
  /// The [borderSide] defines the line's color and weight. The `textDirection`
  /// parameter is ignored.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    if (borderSide.style == BorderStyle.none) {
      return;
    }

    final Paint paint = borderSide.toPaint();

    // Draw top border
    canvas.drawLine(rect.topLeft, rect.topRight, paint);

    // Draw left border
    canvas.drawLine(rect.topLeft, rect.bottomLeft, paint);

    // Draw right border
    canvas.drawLine(rect.topRight, rect.bottomRight, paint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is HideUnderlineInputBorder &&
        other.borderSide == borderSide &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(borderSide, borderRadius);
}
