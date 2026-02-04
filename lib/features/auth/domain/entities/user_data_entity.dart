import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';

class UserDataEntity {
  final int? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? gender;
  final String? image;

  UserDataEntity(
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.gender,
    this.image,
  );

  factory UserDataEntity.fromLoginEntity(LoginEntity loginEntity) {
    return UserDataEntity(
      loginEntity.id,
      loginEntity.username,
      loginEntity.email,
      loginEntity.fullName,
      loginEntity.gender,
      loginEntity.image,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'email': email,
    'fullName': fullName,
    'gender': gender,
    'image': image,
  };
}
