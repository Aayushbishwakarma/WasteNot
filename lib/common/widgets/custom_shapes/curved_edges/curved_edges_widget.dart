import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';

class WNCurvedEdgeWidget extends StatelessWidget {
  const WNCurvedEdgeWidget({
    super.key, this.child,
  });


  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WNCustomCurvedEdges(),
      child:child,
    );
  }
}


