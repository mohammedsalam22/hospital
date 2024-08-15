import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HideAbovelineBorder extends OutlinedBorder {
  const HideAbovelineBorder({
    super.side,
    this.borderRadius = BorderRadius.zero,
  });

  final BorderRadiusGeometry borderRadius;

  @override
  ShapeBorder scale(double t) {
    return HideAbovelineBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is HideAbovelineBorder) {
      return HideAbovelineBorder(
        side: BorderSide.lerp(a.side, side, t),
        borderRadius:
            BorderRadiusGeometry.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is HideAbovelineBorder) {
      return HideAbovelineBorder(
        side: BorderSide.lerp(side, b.side, t),
        borderRadius:
            BorderRadiusGeometry.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  HideAbovelineBorder copyWith(
      {BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return HideAbovelineBorder(
      side: side ?? this.side,
      borderRadius: borderRadius ?? this.borderRadius,
    );
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
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final Paint paint = side.toPaint();

        canvas.drawLine(rect.topLeft, rect.bottomLeft, paint);

        canvas.drawLine(rect.bottomLeft, rect.bottomRight, paint);
        // Draw right border
        canvas.drawLine(rect.topRight, rect.bottomRight, paint);
      // final RRect borderRect =
      //     borderRadius.resolve(textDirection).toRRect(rect);
      // final RRect adjustedRect = borderRect.inflate(side.strokeOutset);
      // final Path path = _getPath(adjustedRect)
      //   ..addPath(
      //       getInnerPath(rect, textDirection: textDirection), Offset.zero);
      // canvas.drawPath(path, side.toPaint());
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is HideAbovelineBorder &&
        other.side == side &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(side, borderRadius);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'HideAbovelineBorder')}($side, $borderRadius)';
  }
}
