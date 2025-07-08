class RegisterDataModel {
  String? username;
  String? email;
  String? password;
  String? whatsapp;
  String? phone;

  RegisterDataModel({
    this.username,
    this.email,
    this.password,
    this.whatsapp,
    this.phone,
  });

  RegisterDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    whatsapp = json['Whatsapp'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['Whatsapp'] = this.whatsapp;
    data['phone'] = this.phone;
    return data;
  }
}
