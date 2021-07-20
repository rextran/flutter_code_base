import 'package:floor/floor.dart';

import '../../../data/models/app_user.dart';

@dao
abstract class AppUserDao {
  @Query('SELECT * FROM AppUser')
  Future<List<AppUser>> findAllAppUsers();

  @Query('SELECT * FROM AppUser WHERE id = :id')
  Stream<AppUser?> findUserById(int id);

  @insert
  Future<void> insertAppUser(List<AppUser> users);

  @delete
  Future<void> deleteAppUser(List<AppUser> users);
}
