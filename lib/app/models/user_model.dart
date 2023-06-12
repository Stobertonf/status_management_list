class UsersModel {
  String idUser;
  String name;
  String profession;
  String email;
  String birth;

  UsersModel({
    required this.idUser,
    required this.name,
    required this.profession,
    required this.email,
    required this.birth,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      idUser: json['idUser'],
      name: json['name'],
      profession: json['profession'],
      email: json['email'],
      birth: json['birth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'name': name,
      'profession': profession,
      'email': email,
      'birth': birth,
    };
  }
}
