import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// News Table
class NewsItems extends Table {
  IntColumn get id => integer()();
  TextColumn get headline => text().nullable()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get datePublished => dateTime()();
  TextColumn get author => text().nullable()();
  IntColumn get schoolId => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// Events Table
class EventItems extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime()();
  IntColumn get campusId => integer()();
  TextColumn get location => text().nullable()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// School Table
class SchoolItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get email => text()();
  TextColumn get website => text()();
  TextColumn get phoneNumber => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// Announcements Table
class AnnouncementItems extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text().nullable()();
  TextColumn get message => text().nullable()();
  DateTimeColumn get datePosted => dateTime()();
  IntColumn get schoolId => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// Cafeteria Items Table
class CafeteriaItems extends Table {
  IntColumn get id => integer()();
  IntColumn get category => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get iconName => text()();
  IntColumn get menuId => integer()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}


@DriftDatabase(
  tables: [
    NewsItems,
    EventItems,
    SchoolItems,
    AnnouncementItems,
    CafeteriaItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // FIX: Migration strategy to actually create your tables
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAllTables();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Placeholder for future updates
    },
    beforeOpen: (details) async {
      // Force WAL mode for speed
      await customStatement('PRAGMA journal_mode=WAL;');
    },
  );

  // ---------------- NEWS ----------------
  Stream<List<NewsItem>> watchAllNews() => select(newsItems).watch();
  Future<List<NewsItem>> getAllNews() => select(newsItems).get();
  Future<void> insertNews(NewsItem item) =>
      into(newsItems).insertOnConflictUpdate(item);

  Future<void> insertAllNews(List<NewsItem> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(newsItems, items);
    });
  }

  Future<void> deleteOldNews(DateTime threshold) {
    return (delete(newsItems)
      ..where((tbl) => tbl.cachedAt.isSmallerThanValue(threshold)))
        .go();
  }

  // ---------------- EVENTS ----------------
  Stream<List<EventItem>> watchAllEvents() => select(eventItems).watch();
  Future<List<EventItem>> getAllEvents() => select(eventItems).get();
  Future<void> insertEvent(EventItem item) =>
      into(eventItems).insertOnConflictUpdate(item);

  Future<void> insertAllEvents(List<EventItem> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(eventItems, items);
    });
  }

  Future<void> deleteOldEvents(DateTime threshold) {
    return (delete(eventItems)
      ..where((tbl) => tbl.cachedAt.isSmallerThanValue(threshold)))
        .go();
  }

  // ---------------- SCHOOL ----------------
  Stream<SchoolItem?> watchSchool() =>
      (select(schoolItems)..limit(1)).watchSingleOrNull();

  Future<SchoolItem?> getSchool() =>
      (select(schoolItems)..limit(1)).getSingleOrNull();

  Future<void> insertSchool(SchoolItem item) =>
      into(schoolItems).insertOnConflictUpdate(item);

  Future<void> deleteOldSchool(DateTime threshold) {
    return (delete(schoolItems)
      ..where((tbl) => tbl.cachedAt.isSmallerThanValue(threshold)))
        .go();
  }

  // ---------------- ANNOUNCEMENTS ----------------
  Stream<List<AnnouncementItem>> watchAllAnnouncements() =>
      select(announcementItems).watch();

  Future<List<AnnouncementItem>> getAllAnnouncements() =>
      select(announcementItems).get();

  Future<void> insertAnnouncement(AnnouncementItem item) =>
      into(announcementItems).insertOnConflictUpdate(item);

  Future<void> insertAllAnnouncements(List<AnnouncementItem> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(announcementItems, items);
    });
  }

  Future<void> deleteOldAnnouncements(DateTime threshold) {
    return (delete(announcementItems)
      ..where((tbl) => tbl.cachedAt.isSmallerThanValue(threshold)))
        .go();
  }

  // ---------------- CAFETERIA ----------------
  Stream<List<CafeteriaItem>> watchAllCafeteriaItems() =>
      select(cafeteriaItems).watch();

  Future<List<CafeteriaItem>> getAllCafeteriaItems() =>
      select(cafeteriaItems).get();

  Future<void> insertCafeteriaItem(CafeteriaItem item) =>
      into(cafeteriaItems).insertOnConflictUpdate(item);

  Future<void> insertAllCafeteriaItems(List<CafeteriaItem> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cafeteriaItems, items);
    });
  }

  Future<void> deleteOldCafeteriaItems(DateTime threshold) {
    return (delete(cafeteriaItems)
      ..where((tbl) => tbl.cachedAt.isSmallerThanValue(threshold)))
        .go();
  }

  // ---------------- CLEAR ALL ----------------
  Future<void> clearAllData() async {
    await delete(newsItems).go();
    await delete(eventItems).go();
    await delete(schoolItems).go();
    await delete(announcementItems).go();
    await delete(cafeteriaItems).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'school_app.sqlite'));
    return NativeDatabase(file);
  });
}
