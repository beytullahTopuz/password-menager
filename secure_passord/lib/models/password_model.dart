class PasswordModel {
  int id;
  String name;
  String username;
  String password;
  String imgUrl;

  PasswordModel(
      {this.id, this.name, this.username, this.password, this.imgUrl});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
