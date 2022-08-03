class UserModel {
  String? user_name;
  String? email;
  String? password;
  String? image;
  String? number;

  UserModel(this.user_name, this.email, this.password, this.image, this.number);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_name': user_name,
      'email': email,
      'password': password,
      'image': image,
      'number': number,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
    image = map['image'];
    number = map['number'];
  }
}
