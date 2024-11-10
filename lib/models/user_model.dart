class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String image;
  final String password;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? "",
      password: json['password'] ?? '',
      role: json['role'] ?? "user",
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
