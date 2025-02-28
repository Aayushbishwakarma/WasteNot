// File: lib/features/authentication/qr_scanner/model/recycling_data.dart
class RecyclingData {
  final String itemType;
  final int count;

  RecyclingData({
    required this.itemType,
    required this.count,
  });

  int get points => count * RecyclingData.getPointsPerItem(itemType);

  static int getPointsPerItem(String objectType) {
    return objectType.toLowerCase() == 'plastic'
        ? 3
        : objectType.toLowerCase() == 'can'
        ? 2
        : 1;
  }
}
