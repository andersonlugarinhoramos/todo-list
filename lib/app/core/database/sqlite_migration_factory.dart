import 'package:todo_list/app/core/database/migrations/migration.dart';
import 'package:todo_list/app/core/database/migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpgradeMigrations(int version) {
    final migrations = <Migration>[];

    // if(version == 1) {
    //   migrations.add(MigrationV2());
    // }
    return migrations;
  }
}
