import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
@entity
class AppUser {
  @primaryKey
  final String id;
  final String name;
  final String avatar;

  AppUser({required this.name, required this.avatar, required this.id});
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
