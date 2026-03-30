class Validators {
  static bool hasAtLeastOneSelected(List<bool> selections) {
    return selections.contains(true);
  }
}