class Admin {
  final int id;
  final String name;
  final String phone;
  final String email;

  Admin(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
