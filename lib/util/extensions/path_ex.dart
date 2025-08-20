import 'dart:ui';
extension PathEx on Path {
  Path createAnimatedPath(
    double animationPercent,
  ) {
    /// Don't know anything about it, just copied code from stackoverflow :)
    /// ComputeMetrics can only be iterated once!
    final double totalLength = computeMetrics()
        .fold(0, (double prev, PathMetric metric) => prev + metric.length);

    final double currentLength = totalLength * animationPercent;

    return _extractPathUntilLength(currentLength);
  }

  Path _extractPathUntilLength(
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    final Iterator<PathMetric> metricsIterator = computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      final PathMetric metric = metricsIterator.current;

      final double nextLength = currentLength + metric.length;

      final bool isLastSegment = nextLength > length;
      if (isLastSegment) {
        final double remainingLength = length - currentLength;
        final Path pathSegment = metric.extractPath(0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final Path pathSegment = metric.extractPath(0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
