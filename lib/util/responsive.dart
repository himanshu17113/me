import '../const.dart';

T responsive<T>({required T? xs, T? sm, T? md, required T lg, T? xl}) {
  switch (mediaQueryData.size.width) {
    case < 550:
      return xs ?? sm ?? md ?? lg;
    case < 1024:
      return sm ?? md ?? lg;
    case < 1440:
      return md ?? lg;
    case < 1920:
      return lg;
    case >= 1920:
      return xl ?? lg;

    default:
      return lg;
  }
}
