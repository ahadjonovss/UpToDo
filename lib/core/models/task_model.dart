class Task {
  int? id;
  String title;
  String description;
  String date;
  String time;
  int priority;
  int isComplated;
  String category;

  Task(
      {
        id,
        required this.title,
      required this.description,
      required this.category,
      required this.date,
      required this.isComplated,
      required this.priority,
      required this.time});

  factory Task.fromJson(Map<String, dynamic> json) {
    String title = json['title'] ?? "";
    String description = json['description'] ?? "";
    String date = json['date'] ?? "";
    String time = json['time'] ?? "";
    int priority = json['priority'] ?? 0;
    int isComplated = json['isComplated'] ?? 0;
    String category = json['category'] ?? "";

    return Task(
        title: title,
        description: description,
        category: category,
        date: date,
        isComplated: isComplated,
        priority: priority,
        time: time);
  }

  Map<String,dynamic> toJson(){
    return {
      "title": this.title,
      "description": this.description,
      "date": this.date,
      "time": this.time,
      "priority": this.priority,
      "isCompleted": this.isComplated,
      "category": this.category,
    };
  }
  Task copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? time,
    int? priority,
    int? isComplated,
    String? category,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        category: category??this.category,
        isComplated: isComplated??this.isComplated,
        priority: priority??this.priority,
        time:time??this.time,
      );

}
