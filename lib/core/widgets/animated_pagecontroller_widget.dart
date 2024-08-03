

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Creates a [CustomTransitionPage] widget with a custom slide transition animation.
///
/// The [child] parameter is required and represents the child widget to be displayed within the transition page.
///
/// The [transitionsBuilder] parameter is a callback function that defines the transition animation.
/// It takes four parameters:
/// - [context]: the build context of the transition page.
/// - [animation]: the animation controller for the transition.
/// - [secondaryAnimation]: the secondary animation controller for the transition.
/// - [child]: the child widget to be displayed within the transition page.
///
/// The function returns a [CustomTransitionPage] widget with the specified child and transition animation.
///
/// The transition animation is defined using a slide transition. It starts with an offset of (1.0, 0.0) and ends with an offset of (0.0, 0.0).
/// The animation curve is defined as [Curves.easeInOut].
///
/// The [SlideTransition] widget is used to apply the slide transition animation to the child widget.
/// The [position] property of the [SlideTransition] is set to the animated offset animation.
///
/// Returns a [CustomTransitionPage] widget.
CustomTransitionPage customTransitionPage({required Widget child}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}



