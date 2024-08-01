import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:laundry_bin/core/extension/theme_extension.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
  });

  @override

  /// Builds a [CouponCard] widget with specific properties and children.
  ///
  /// The [CouponCard] widget is built with the following properties:
  /// - `height`: The height of the widget.
  /// - `backgroundColor`: The background color of the widget.
  /// - `clockwise`: Whether the widget should rotate clockwise.
  /// - `curvePosition`: The position of the curve.
  /// - `curveRadius`: The radius of the curve.
  /// - `curveAxis`: The axis of the curve.
  /// - `borderRadius`: The border radius of the widget.
  ///
  /// The widget has two children:
  /// - The first child is a [Container] with a [BoxDecoration] and a [Column] child.
  ///   - The [BoxDecoration] has a color set to `context.colors.primary`.
  ///   - The [Column] has a [MainAxisAlignment] of `MainAxisAlignment.center` and contains three children:
  ///     - An [Expanded] widget with a [Center] child containing a [Column] with three children:
  ///       - A [Text] widget with the text 'Get' and a style copied from `context.typography.bodyLarge` with the color set to `context.colors.white`.
  ///       - A [Text] widget with the text '40%' and a style copied from `context.typography.h3` with the color set to `context.colors.white`.
  ///       - A [Text] widget with the text 'OFF' and a style copied from `context.typography.bodyLarge` with the color set to `context.colors.white`.
  ///     - A [Divider] widget with a color set to `context.colors.chatbox` and a height of 0.
  ///     - An [Expanded] widget with a [Center] child containing a [Text] widget with the text 'Dry cleaning For Selcted Items', a text alignment of `TextAlign.center`, and a style copied from `context.typography.bodySemiBold` with the color set to `context.colors.white`.
  /// - The second child is a [Container] with a width of `double.maxFinite`, padding of `const EdgeInsets.all(18)`, and a [Column] child.
  ///   - The [Column] has a [MainAxisSize] of `MainAxisSize.min`, a [CrossAxisAlignment] of `CrossAxisAlignment.start`, and contains three children:
  ///     - A [Text] widget with the text 'Coupon Code', a text alignment of `TextAlign.center`, and a style copied from `context.typography.bodyMedium` with the color set to `context.colors.primaryTxt`.
  ///     - A [SizedBox] widget with a height of 4.
  ///     - A [Text] widget with the text 'Flat500', a text alignment of `TextAlign.center`, and a style copied from `context.typography.h2` with the color set to `context.colors.primary`.
  ///     - A [Spacer] widget.
  ///     - A [Text] widget with the text 'Valid Till - 30 Jan 2022', a text alignment of `TextAlign.center`, and a style with a color set to `context.colors.hintTxt`.
  ///
  /// Returns a [CouponCard] widget.
  Widget build(BuildContext context) {
    return CouponCard(
      height: 200,
      backgroundColor: context.colors.white,
      clockwise: true,
      curvePosition: 135,
      curveRadius: 30,
      curveAxis: Axis.vertical,
      borderRadius: 10,
      firstChild: Container(
        decoration: BoxDecoration(
          color: context.colors.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Get',
                      style: context.typography.bodyLarge
                          .copyWith(color: context.colors.white),
                    ),
                    Text(
                      '40%',
                      style: context.typography.h3
                          .copyWith(color: context.colors.white),
                    ),
                    Text(
                      'OFF',
                      style: context.typography.bodyLarge
                          .copyWith(color: context.colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: context.colors.chatbox, height: 0),
            Expanded(
              child: Center(
                child: Text('Dry cleaning For  Selcted Items',
                    textAlign: TextAlign.center,
                    style: context.typography.bodySemiBold
                        .copyWith(color: context.colors.white)),
              ),
            ),
          ],
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Coupon Code',
                textAlign: TextAlign.center,
                style: context.typography.bodyMedium
                    .copyWith(color: context.colors.primaryTxt)),
            const SizedBox(height: 4),
            Text('Flat500',
                textAlign: TextAlign.left,
                style: context.typography.h2
                    .copyWith(color: context.colors.primary)),
            const Spacer(),
            Text('The Order value greater 4000',
                textAlign: TextAlign.center,
                style: context.typography.bodyMedium
                    .copyWith(color: context.colors.primaryTxt)),
            const Spacer(),
            Text(
              'Valid Till - 30 Jan 2022',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.hintTxt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
