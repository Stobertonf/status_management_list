class TaskModel {
  String idTask;
  String title;
  String description;
  String userId;
  String categoryId;

  TaskModel({
    required this.idTask,
    required this.title,
    required this.description,
    required this.userId,
    required this.categoryId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      idTask: json['IDTask'],
      title: json['Title'],
      description: json['Description'],
      userId: json['UserID'],
      categoryId: json['CategoryID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IDTask': idTask,
      'Title': title,
      'Description': description,
      'UserID': userId,
      'CategoryID': categoryId,
    };
  }
}
