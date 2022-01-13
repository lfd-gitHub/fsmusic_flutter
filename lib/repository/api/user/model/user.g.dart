// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      locked: json['locked'] as bool,
      enabled: json['enabled'] as bool,
      lastLoginIp: json['lastLoginIp'] as String?,
      lastLoginTime: json['lastLoginTime'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'locked': instance.locked,
      'enabled': instance.enabled,
      'lastLoginIp': instance.lastLoginIp,
      'lastLoginTime': instance.lastLoginTime,
    };
