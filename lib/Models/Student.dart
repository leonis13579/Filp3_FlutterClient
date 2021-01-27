class Student {
  int studentId;
  String name;
  String lastName;
  String email;

  static Student _instance;
  static Student get instance => _instance != null ? _instance : Student();

  void fromJson(Map<String, dynamic> json) {
    name = json["name"];
    lastName = json["last_name"];
    studentId = json["id"];
    email = json["email"];

    _instance = this;
  }
}