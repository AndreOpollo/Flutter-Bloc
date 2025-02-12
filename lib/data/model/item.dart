class Item {
  final int id;
  final String title;
  final String completed;

  const Item({required this.id, required this.title, required this.completed});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        title: json['title'],
        completed: json['completed'].toString());
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}
