class CategoryItem {
  final String headerValue;
  final List<String> expandedValues;
  bool isExpanded;

  CategoryItem({
    required this.headerValue,
    required this.expandedValues,
    this.isExpanded = false,
  });
}