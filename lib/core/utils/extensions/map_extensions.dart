extension MapExtensions on Map? {
  void removeInvalidValues() => this?.removeWhere(
        (key, value) => key == null || value == null,
      );
}
