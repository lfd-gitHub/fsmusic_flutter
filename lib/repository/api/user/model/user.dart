import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String nickname;
  String gender;
  bool locked;
  bool enabled;
  String? lastLoginIp;
  int? lastLoginTime;

  User({
    required this.username,
    required this.nickname,
    required this.gender,
    required this.locked,
    required this.enabled,
    this.lastLoginIp,
    this.lastLoginTime,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User(username: $username, nickname: $nickname, gender: $gender, locked: $locked, enabled: $enabled, lastLoginIp: $lastLoginIp, lastLoginTime: $lastLoginTime)';
  }
}
