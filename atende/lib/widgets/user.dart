import 'dart:ffi';

class user {
  String name = "";
  String cpf = "";
  String password = "";
  String email = "";

  user({this.email = "julia.teste@gmail.com", this.password = "123456"}) {}

  user.fromMap(Map map) {
    name = map[propsUser.name];
    cpf = map[propsUser.cpf];
    password = map[propsUser.password];
    email = map[propsUser.email];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      propsUser.name: name,
      propsUser.cpf: cpf,
      propsUser.password: password,
      propsUser.email: email,
    };
    return map;
  }
}

class propsUser {
  static String name = "name";
  static String cpf = "cpf";
  static String password = "password";
  static String email = "email";
}
