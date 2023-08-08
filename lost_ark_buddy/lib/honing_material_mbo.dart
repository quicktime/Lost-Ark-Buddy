class HoningMaterial {
  HoningMaterial({
    required this.id,
    required this.name,
    this.cost,
  });

  String id;
  String name;
  double? cost;

  void setCost(double cost) {
    this.cost = cost;
  }
}
