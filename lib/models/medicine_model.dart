class Task {
  int ? id;
  String ? name;
  String ? description;
  String ? time;

  Task.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    time = json['time'];
  }
}