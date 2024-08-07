import 'package:flutter/material.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/config/flavor.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    super.key,
    required this.flavor,
    required this.child,
  });

  final Widget child;
  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    if (flavor == Flavor.production) return child;

    return Stack(
      children: <Widget>[
        child,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: BannerPainter(
                message: flavor.name,
                textDirection: Directionality.of(context),
                layoutDirection: Directionality.of(context),
                location: BannerLocation.topStart,
                color: flavor.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
