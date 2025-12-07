// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NewsItemsTable extends NewsItems
    with TableInfo<$NewsItemsTable, NewsItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _headlineMeta = const VerificationMeta(
    'headline',
  );
  @override
  late final GeneratedColumn<String> headline = GeneratedColumn<String>(
    'headline',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _datePublishedMeta = const VerificationMeta(
    'datePublished',
  );
  @override
  late final GeneratedColumn<DateTime> datePublished =
      GeneratedColumn<DateTime>(
        'date_published',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    headline,
    content,
    datePublished,
    author,
    schoolId,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<NewsItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('headline')) {
      context.handle(
        _headlineMeta,
        headline.isAcceptableOrUnknown(data['headline']!, _headlineMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('date_published')) {
      context.handle(
        _datePublishedMeta,
        datePublished.isAcceptableOrUnknown(
          data['date_published']!,
          _datePublishedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_datePublishedMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      headline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}headline'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      datePublished: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_published'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $NewsItemsTable createAlias(String alias) {
    return $NewsItemsTable(attachedDatabase, alias);
  }
}

class NewsItem extends DataClass implements Insertable<NewsItem> {
  final int id;
  final String? headline;
  final String? content;
  final DateTime datePublished;
  final String? author;
  final int schoolId;
  final DateTime cachedAt;
  const NewsItem({
    required this.id,
    this.headline,
    this.content,
    required this.datePublished,
    this.author,
    required this.schoolId,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || headline != null) {
      map['headline'] = Variable<String>(headline);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['date_published'] = Variable<DateTime>(datePublished);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['school_id'] = Variable<int>(schoolId);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  NewsItemsCompanion toCompanion(bool nullToAbsent) {
    return NewsItemsCompanion(
      id: Value(id),
      headline: headline == null && nullToAbsent
          ? const Value.absent()
          : Value(headline),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      datePublished: Value(datePublished),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      schoolId: Value(schoolId),
      cachedAt: Value(cachedAt),
    );
  }

  factory NewsItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsItem(
      id: serializer.fromJson<int>(json['id']),
      headline: serializer.fromJson<String?>(json['headline']),
      content: serializer.fromJson<String?>(json['content']),
      datePublished: serializer.fromJson<DateTime>(json['datePublished']),
      author: serializer.fromJson<String?>(json['author']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'headline': serializer.toJson<String?>(headline),
      'content': serializer.toJson<String?>(content),
      'datePublished': serializer.toJson<DateTime>(datePublished),
      'author': serializer.toJson<String?>(author),
      'schoolId': serializer.toJson<int>(schoolId),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  NewsItem copyWith({
    int? id,
    Value<String?> headline = const Value.absent(),
    Value<String?> content = const Value.absent(),
    DateTime? datePublished,
    Value<String?> author = const Value.absent(),
    int? schoolId,
    DateTime? cachedAt,
  }) => NewsItem(
    id: id ?? this.id,
    headline: headline.present ? headline.value : this.headline,
    content: content.present ? content.value : this.content,
    datePublished: datePublished ?? this.datePublished,
    author: author.present ? author.value : this.author,
    schoolId: schoolId ?? this.schoolId,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  NewsItem copyWithCompanion(NewsItemsCompanion data) {
    return NewsItem(
      id: data.id.present ? data.id.value : this.id,
      headline: data.headline.present ? data.headline.value : this.headline,
      content: data.content.present ? data.content.value : this.content,
      datePublished: data.datePublished.present
          ? data.datePublished.value
          : this.datePublished,
      author: data.author.present ? data.author.value : this.author,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsItem(')
          ..write('id: $id, ')
          ..write('headline: $headline, ')
          ..write('content: $content, ')
          ..write('datePublished: $datePublished, ')
          ..write('author: $author, ')
          ..write('schoolId: $schoolId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    headline,
    content,
    datePublished,
    author,
    schoolId,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsItem &&
          other.id == this.id &&
          other.headline == this.headline &&
          other.content == this.content &&
          other.datePublished == this.datePublished &&
          other.author == this.author &&
          other.schoolId == this.schoolId &&
          other.cachedAt == this.cachedAt);
}

class NewsItemsCompanion extends UpdateCompanion<NewsItem> {
  final Value<int> id;
  final Value<String?> headline;
  final Value<String?> content;
  final Value<DateTime> datePublished;
  final Value<String?> author;
  final Value<int> schoolId;
  final Value<DateTime> cachedAt;
  const NewsItemsCompanion({
    this.id = const Value.absent(),
    this.headline = const Value.absent(),
    this.content = const Value.absent(),
    this.datePublished = const Value.absent(),
    this.author = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  NewsItemsCompanion.insert({
    this.id = const Value.absent(),
    this.headline = const Value.absent(),
    this.content = const Value.absent(),
    required DateTime datePublished,
    this.author = const Value.absent(),
    required int schoolId,
    required DateTime cachedAt,
  }) : datePublished = Value(datePublished),
       schoolId = Value(schoolId),
       cachedAt = Value(cachedAt);
  static Insertable<NewsItem> custom({
    Expression<int>? id,
    Expression<String>? headline,
    Expression<String>? content,
    Expression<DateTime>? datePublished,
    Expression<String>? author,
    Expression<int>? schoolId,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (headline != null) 'headline': headline,
      if (content != null) 'content': content,
      if (datePublished != null) 'date_published': datePublished,
      if (author != null) 'author': author,
      if (schoolId != null) 'school_id': schoolId,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  NewsItemsCompanion copyWith({
    Value<int>? id,
    Value<String?>? headline,
    Value<String?>? content,
    Value<DateTime>? datePublished,
    Value<String?>? author,
    Value<int>? schoolId,
    Value<DateTime>? cachedAt,
  }) {
    return NewsItemsCompanion(
      id: id ?? this.id,
      headline: headline ?? this.headline,
      content: content ?? this.content,
      datePublished: datePublished ?? this.datePublished,
      author: author ?? this.author,
      schoolId: schoolId ?? this.schoolId,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (headline.present) {
      map['headline'] = Variable<String>(headline.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (datePublished.present) {
      map['date_published'] = Variable<DateTime>(datePublished.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsItemsCompanion(')
          ..write('id: $id, ')
          ..write('headline: $headline, ')
          ..write('content: $content, ')
          ..write('datePublished: $datePublished, ')
          ..write('author: $author, ')
          ..write('schoolId: $schoolId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $EventItemsTable extends EventItems
    with TableInfo<$EventItemsTable, EventItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
    'start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
    'end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campusIdMeta = const VerificationMeta(
    'campusId',
  );
  @override
  late final GeneratedColumn<int> campusId = GeneratedColumn<int>(
    'campus_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    start,
    end,
    campusId,
    location,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
        _endMeta,
        end.isAcceptableOrUnknown(data['end']!, _endMeta),
      );
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('campus_id')) {
      context.handle(
        _campusIdMeta,
        campusId.isAcceptableOrUnknown(data['campus_id']!, _campusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_campusIdMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      start: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start'],
      )!,
      end: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end'],
      )!,
      campusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}campus_id'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $EventItemsTable createAlias(String alias) {
    return $EventItemsTable(attachedDatabase, alias);
  }
}

class EventItem extends DataClass implements Insertable<EventItem> {
  final int id;
  final String? title;
  final String? description;
  final DateTime start;
  final DateTime end;
  final int campusId;
  final String? location;
  final DateTime cachedAt;
  const EventItem({
    required this.id,
    this.title,
    this.description,
    required this.start,
    required this.end,
    required this.campusId,
    this.location,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    map['campus_id'] = Variable<int>(campusId);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  EventItemsCompanion toCompanion(bool nullToAbsent) {
    return EventItemsCompanion(
      id: Value(id),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      start: Value(start),
      end: Value(end),
      campusId: Value(campusId),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      cachedAt: Value(cachedAt),
    );
  }

  factory EventItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      campusId: serializer.fromJson<int>(json['campusId']),
      location: serializer.fromJson<String?>(json['location']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'campusId': serializer.toJson<int>(campusId),
      'location': serializer.toJson<String?>(location),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  EventItem copyWith({
    int? id,
    Value<String?> title = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? start,
    DateTime? end,
    int? campusId,
    Value<String?> location = const Value.absent(),
    DateTime? cachedAt,
  }) => EventItem(
    id: id ?? this.id,
    title: title.present ? title.value : this.title,
    description: description.present ? description.value : this.description,
    start: start ?? this.start,
    end: end ?? this.end,
    campusId: campusId ?? this.campusId,
    location: location.present ? location.value : this.location,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  EventItem copyWithCompanion(EventItemsCompanion data) {
    return EventItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      campusId: data.campusId.present ? data.campusId.value : this.campusId,
      location: data.location.present ? data.location.value : this.location,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('campusId: $campusId, ')
          ..write('location: $location, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    start,
    end,
    campusId,
    location,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.start == this.start &&
          other.end == this.end &&
          other.campusId == this.campusId &&
          other.location == this.location &&
          other.cachedAt == this.cachedAt);
}

class EventItemsCompanion extends UpdateCompanion<EventItem> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> description;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<int> campusId;
  final Value<String?> location;
  final Value<DateTime> cachedAt;
  const EventItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.campusId = const Value.absent(),
    this.location = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  EventItemsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime start,
    required DateTime end,
    required int campusId,
    this.location = const Value.absent(),
    required DateTime cachedAt,
  }) : start = Value(start),
       end = Value(end),
       campusId = Value(campusId),
       cachedAt = Value(cachedAt);
  static Insertable<EventItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<int>? campusId,
    Expression<String>? location,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (campusId != null) 'campus_id': campusId,
      if (location != null) 'location': location,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  EventItemsCompanion copyWith({
    Value<int>? id,
    Value<String?>? title,
    Value<String?>? description,
    Value<DateTime>? start,
    Value<DateTime>? end,
    Value<int>? campusId,
    Value<String?>? location,
    Value<DateTime>? cachedAt,
  }) {
    return EventItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      start: start ?? this.start,
      end: end ?? this.end,
      campusId: campusId ?? this.campusId,
      location: location ?? this.location,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (campusId.present) {
      map['campus_id'] = Variable<int>(campusId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('campusId: $campusId, ')
          ..write('location: $location, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $SchoolItemsTable extends SchoolItems
    with TableInfo<$SchoolItemsTable, SchoolItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    website,
    phoneNumber,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchoolItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $SchoolItemsTable createAlias(String alias) {
    return $SchoolItemsTable(attachedDatabase, alias);
  }
}

class SchoolItem extends DataClass implements Insertable<SchoolItem> {
  final int id;
  final String? name;
  final String email;
  final String website;
  final String phoneNumber;
  final DateTime cachedAt;
  const SchoolItem({
    required this.id,
    this.name,
    required this.email,
    required this.website,
    required this.phoneNumber,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['email'] = Variable<String>(email);
    map['website'] = Variable<String>(website);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  SchoolItemsCompanion toCompanion(bool nullToAbsent) {
    return SchoolItemsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email: Value(email),
      website: Value(website),
      phoneNumber: Value(phoneNumber),
      cachedAt: Value(cachedAt),
    );
  }

  factory SchoolItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      website: serializer.fromJson<String>(json['website']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String>(email),
      'website': serializer.toJson<String>(website),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  SchoolItem copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    String? email,
    String? website,
    String? phoneNumber,
    DateTime? cachedAt,
  }) => SchoolItem(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    email: email ?? this.email,
    website: website ?? this.website,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  SchoolItem copyWithCompanion(SchoolItemsCompanion data) {
    return SchoolItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, website, phoneNumber, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.website == this.website &&
          other.phoneNumber == this.phoneNumber &&
          other.cachedAt == this.cachedAt);
}

class SchoolItemsCompanion extends UpdateCompanion<SchoolItem> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String> email;
  final Value<String> website;
  final Value<String> phoneNumber;
  final Value<DateTime> cachedAt;
  const SchoolItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  SchoolItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required String email,
    required String website,
    required String phoneNumber,
    required DateTime cachedAt,
  }) : email = Value(email),
       website = Value(website),
       phoneNumber = Value(phoneNumber),
       cachedAt = Value(cachedAt);
  static Insertable<SchoolItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? website,
    Expression<String>? phoneNumber,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  SchoolItemsCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<String>? email,
    Value<String>? website,
    Value<String>? phoneNumber,
    Value<DateTime>? cachedAt,
  }) {
    return SchoolItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      website: website ?? this.website,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $AnnouncementItemsTable extends AnnouncementItems
    with TableInfo<$AnnouncementItemsTable, AnnouncementItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnnouncementItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _datePostedMeta = const VerificationMeta(
    'datePosted',
  );
  @override
  late final GeneratedColumn<DateTime> datePosted = GeneratedColumn<DateTime>(
    'date_posted',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    message,
    datePosted,
    schoolId,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'announcement_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnnouncementItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('date_posted')) {
      context.handle(
        _datePostedMeta,
        datePosted.isAcceptableOrUnknown(data['date_posted']!, _datePostedMeta),
      );
    } else if (isInserting) {
      context.missing(_datePostedMeta);
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnnouncementItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnnouncementItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      datePosted: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_posted'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $AnnouncementItemsTable createAlias(String alias) {
    return $AnnouncementItemsTable(attachedDatabase, alias);
  }
}

class AnnouncementItem extends DataClass
    implements Insertable<AnnouncementItem> {
  final int id;
  final String? title;
  final String? message;
  final DateTime datePosted;
  final int schoolId;
  final DateTime cachedAt;
  const AnnouncementItem({
    required this.id,
    this.title,
    this.message,
    required this.datePosted,
    required this.schoolId,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['date_posted'] = Variable<DateTime>(datePosted);
    map['school_id'] = Variable<int>(schoolId);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  AnnouncementItemsCompanion toCompanion(bool nullToAbsent) {
    return AnnouncementItemsCompanion(
      id: Value(id),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      datePosted: Value(datePosted),
      schoolId: Value(schoolId),
      cachedAt: Value(cachedAt),
    );
  }

  factory AnnouncementItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnnouncementItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      message: serializer.fromJson<String?>(json['message']),
      datePosted: serializer.fromJson<DateTime>(json['datePosted']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'message': serializer.toJson<String?>(message),
      'datePosted': serializer.toJson<DateTime>(datePosted),
      'schoolId': serializer.toJson<int>(schoolId),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  AnnouncementItem copyWith({
    int? id,
    Value<String?> title = const Value.absent(),
    Value<String?> message = const Value.absent(),
    DateTime? datePosted,
    int? schoolId,
    DateTime? cachedAt,
  }) => AnnouncementItem(
    id: id ?? this.id,
    title: title.present ? title.value : this.title,
    message: message.present ? message.value : this.message,
    datePosted: datePosted ?? this.datePosted,
    schoolId: schoolId ?? this.schoolId,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  AnnouncementItem copyWithCompanion(AnnouncementItemsCompanion data) {
    return AnnouncementItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      datePosted: data.datePosted.present
          ? data.datePosted.value
          : this.datePosted,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnnouncementItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('datePosted: $datePosted, ')
          ..write('schoolId: $schoolId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, message, datePosted, schoolId, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnnouncementItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.message == this.message &&
          other.datePosted == this.datePosted &&
          other.schoolId == this.schoolId &&
          other.cachedAt == this.cachedAt);
}

class AnnouncementItemsCompanion extends UpdateCompanion<AnnouncementItem> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> message;
  final Value<DateTime> datePosted;
  final Value<int> schoolId;
  final Value<DateTime> cachedAt;
  const AnnouncementItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.datePosted = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  AnnouncementItemsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    required DateTime datePosted,
    required int schoolId,
    required DateTime cachedAt,
  }) : datePosted = Value(datePosted),
       schoolId = Value(schoolId),
       cachedAt = Value(cachedAt);
  static Insertable<AnnouncementItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? message,
    Expression<DateTime>? datePosted,
    Expression<int>? schoolId,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (datePosted != null) 'date_posted': datePosted,
      if (schoolId != null) 'school_id': schoolId,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  AnnouncementItemsCompanion copyWith({
    Value<int>? id,
    Value<String?>? title,
    Value<String?>? message,
    Value<DateTime>? datePosted,
    Value<int>? schoolId,
    Value<DateTime>? cachedAt,
  }) {
    return AnnouncementItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      datePosted: datePosted ?? this.datePosted,
      schoolId: schoolId ?? this.schoolId,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (datePosted.present) {
      map['date_posted'] = Variable<DateTime>(datePosted.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnnouncementItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('datePosted: $datePosted, ')
          ..write('schoolId: $schoolId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CafeteriaItemsTable extends CafeteriaItems
    with TableInfo<$CafeteriaItemsTable, CafeteriaItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CafeteriaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconNameMeta = const VerificationMeta(
    'iconName',
  );
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
    'icon_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _menuIdMeta = const VerificationMeta('menuId');
  @override
  late final GeneratedColumn<int> menuId = GeneratedColumn<int>(
    'menu_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    name,
    description,
    iconName,
    menuId,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cafeteria_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CafeteriaItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(
        _iconNameMeta,
        iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta),
      );
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('menu_id')) {
      context.handle(
        _menuIdMeta,
        menuId.isAcceptableOrUnknown(data['menu_id']!, _menuIdMeta),
      );
    } else if (isInserting) {
      context.missing(_menuIdMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CafeteriaItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CafeteriaItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_name'],
      )!,
      menuId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}menu_id'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CafeteriaItemsTable createAlias(String alias) {
    return $CafeteriaItemsTable(attachedDatabase, alias);
  }
}

class CafeteriaItem extends DataClass implements Insertable<CafeteriaItem> {
  final int id;
  final int category;
  final String name;
  final String description;
  final String iconName;
  final int menuId;
  final DateTime cachedAt;
  const CafeteriaItem({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.iconName,
    required this.menuId,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<int>(category);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon_name'] = Variable<String>(iconName);
    map['menu_id'] = Variable<int>(menuId);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CafeteriaItemsCompanion toCompanion(bool nullToAbsent) {
    return CafeteriaItemsCompanion(
      id: Value(id),
      category: Value(category),
      name: Value(name),
      description: Value(description),
      iconName: Value(iconName),
      menuId: Value(menuId),
      cachedAt: Value(cachedAt),
    );
  }

  factory CafeteriaItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CafeteriaItem(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<int>(json['category']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      iconName: serializer.fromJson<String>(json['iconName']),
      menuId: serializer.fromJson<int>(json['menuId']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<int>(category),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'iconName': serializer.toJson<String>(iconName),
      'menuId': serializer.toJson<int>(menuId),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CafeteriaItem copyWith({
    int? id,
    int? category,
    String? name,
    String? description,
    String? iconName,
    int? menuId,
    DateTime? cachedAt,
  }) => CafeteriaItem(
    id: id ?? this.id,
    category: category ?? this.category,
    name: name ?? this.name,
    description: description ?? this.description,
    iconName: iconName ?? this.iconName,
    menuId: menuId ?? this.menuId,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CafeteriaItem copyWithCompanion(CafeteriaItemsCompanion data) {
    return CafeteriaItem(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      menuId: data.menuId.present ? data.menuId.value : this.menuId,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CafeteriaItem(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('menuId: $menuId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, category, name, description, iconName, menuId, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CafeteriaItem &&
          other.id == this.id &&
          other.category == this.category &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconName == this.iconName &&
          other.menuId == this.menuId &&
          other.cachedAt == this.cachedAt);
}

class CafeteriaItemsCompanion extends UpdateCompanion<CafeteriaItem> {
  final Value<int> id;
  final Value<int> category;
  final Value<String> name;
  final Value<String> description;
  final Value<String> iconName;
  final Value<int> menuId;
  final Value<DateTime> cachedAt;
  const CafeteriaItemsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.menuId = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CafeteriaItemsCompanion.insert({
    this.id = const Value.absent(),
    required int category,
    required String name,
    required String description,
    required String iconName,
    required int menuId,
    required DateTime cachedAt,
  }) : category = Value(category),
       name = Value(name),
       description = Value(description),
       iconName = Value(iconName),
       menuId = Value(menuId),
       cachedAt = Value(cachedAt);
  static Insertable<CafeteriaItem> custom({
    Expression<int>? id,
    Expression<int>? category,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconName,
    Expression<int>? menuId,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'icon_name': iconName,
      if (menuId != null) 'menu_id': menuId,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CafeteriaItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? category,
    Value<String>? name,
    Value<String>? description,
    Value<String>? iconName,
    Value<int>? menuId,
    Value<DateTime>? cachedAt,
  }) {
    return CafeteriaItemsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      menuId: menuId ?? this.menuId,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (menuId.present) {
      map['menu_id'] = Variable<int>(menuId.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CafeteriaItemsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('menuId: $menuId, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NewsItemsTable newsItems = $NewsItemsTable(this);
  late final $EventItemsTable eventItems = $EventItemsTable(this);
  late final $SchoolItemsTable schoolItems = $SchoolItemsTable(this);
  late final $AnnouncementItemsTable announcementItems =
      $AnnouncementItemsTable(this);
  late final $CafeteriaItemsTable cafeteriaItems = $CafeteriaItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    newsItems,
    eventItems,
    schoolItems,
    announcementItems,
    cafeteriaItems,
  ];
}

typedef $$NewsItemsTableCreateCompanionBuilder =
    NewsItemsCompanion Function({
      Value<int> id,
      Value<String?> headline,
      Value<String?> content,
      required DateTime datePublished,
      Value<String?> author,
      required int schoolId,
      required DateTime cachedAt,
    });
typedef $$NewsItemsTableUpdateCompanionBuilder =
    NewsItemsCompanion Function({
      Value<int> id,
      Value<String?> headline,
      Value<String?> content,
      Value<DateTime> datePublished,
      Value<String?> author,
      Value<int> schoolId,
      Value<DateTime> cachedAt,
    });

class $$NewsItemsTableFilterComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headline => $composableBuilder(
    column: $table.headline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datePublished => $composableBuilder(
    column: $table.datePublished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NewsItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headline => $composableBuilder(
    column: $table.headline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datePublished => $composableBuilder(
    column: $table.datePublished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NewsItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsItemsTable> {
  $$NewsItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get headline =>
      $composableBuilder(column: $table.headline, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get datePublished => $composableBuilder(
    column: $table.datePublished,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<int> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$NewsItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NewsItemsTable,
          NewsItem,
          $$NewsItemsTableFilterComposer,
          $$NewsItemsTableOrderingComposer,
          $$NewsItemsTableAnnotationComposer,
          $$NewsItemsTableCreateCompanionBuilder,
          $$NewsItemsTableUpdateCompanionBuilder,
          (NewsItem, BaseReferences<_$AppDatabase, $NewsItemsTable, NewsItem>),
          NewsItem,
          PrefetchHooks Function()
        > {
  $$NewsItemsTableTableManager(_$AppDatabase db, $NewsItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> headline = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> datePublished = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => NewsItemsCompanion(
                id: id,
                headline: headline,
                content: content,
                datePublished: datePublished,
                author: author,
                schoolId: schoolId,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> headline = const Value.absent(),
                Value<String?> content = const Value.absent(),
                required DateTime datePublished,
                Value<String?> author = const Value.absent(),
                required int schoolId,
                required DateTime cachedAt,
              }) => NewsItemsCompanion.insert(
                id: id,
                headline: headline,
                content: content,
                datePublished: datePublished,
                author: author,
                schoolId: schoolId,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NewsItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NewsItemsTable,
      NewsItem,
      $$NewsItemsTableFilterComposer,
      $$NewsItemsTableOrderingComposer,
      $$NewsItemsTableAnnotationComposer,
      $$NewsItemsTableCreateCompanionBuilder,
      $$NewsItemsTableUpdateCompanionBuilder,
      (NewsItem, BaseReferences<_$AppDatabase, $NewsItemsTable, NewsItem>),
      NewsItem,
      PrefetchHooks Function()
    >;
typedef $$EventItemsTableCreateCompanionBuilder =
    EventItemsCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> description,
      required DateTime start,
      required DateTime end,
      required int campusId,
      Value<String?> location,
      required DateTime cachedAt,
    });
typedef $$EventItemsTableUpdateCompanionBuilder =
    EventItemsCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> description,
      Value<DateTime> start,
      Value<DateTime> end,
      Value<int> campusId,
      Value<String?> location,
      Value<DateTime> cachedAt,
    });

class $$EventItemsTableFilterComposer
    extends Composer<_$AppDatabase, $EventItemsTable> {
  $$EventItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get campusId => $composableBuilder(
    column: $table.campusId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EventItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventItemsTable> {
  $$EventItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get campusId => $composableBuilder(
    column: $table.campusId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventItemsTable> {
  $$EventItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumn<int> get campusId =>
      $composableBuilder(column: $table.campusId, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$EventItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventItemsTable,
          EventItem,
          $$EventItemsTableFilterComposer,
          $$EventItemsTableOrderingComposer,
          $$EventItemsTableAnnotationComposer,
          $$EventItemsTableCreateCompanionBuilder,
          $$EventItemsTableUpdateCompanionBuilder,
          (
            EventItem,
            BaseReferences<_$AppDatabase, $EventItemsTable, EventItem>,
          ),
          EventItem,
          PrefetchHooks Function()
        > {
  $$EventItemsTableTableManager(_$AppDatabase db, $EventItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> start = const Value.absent(),
                Value<DateTime> end = const Value.absent(),
                Value<int> campusId = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => EventItemsCompanion(
                id: id,
                title: title,
                description: description,
                start: start,
                end: end,
                campusId: campusId,
                location: location,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime start,
                required DateTime end,
                required int campusId,
                Value<String?> location = const Value.absent(),
                required DateTime cachedAt,
              }) => EventItemsCompanion.insert(
                id: id,
                title: title,
                description: description,
                start: start,
                end: end,
                campusId: campusId,
                location: location,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EventItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventItemsTable,
      EventItem,
      $$EventItemsTableFilterComposer,
      $$EventItemsTableOrderingComposer,
      $$EventItemsTableAnnotationComposer,
      $$EventItemsTableCreateCompanionBuilder,
      $$EventItemsTableUpdateCompanionBuilder,
      (EventItem, BaseReferences<_$AppDatabase, $EventItemsTable, EventItem>),
      EventItem,
      PrefetchHooks Function()
    >;
typedef $$SchoolItemsTableCreateCompanionBuilder =
    SchoolItemsCompanion Function({
      Value<int> id,
      Value<String?> name,
      required String email,
      required String website,
      required String phoneNumber,
      required DateTime cachedAt,
    });
typedef $$SchoolItemsTableUpdateCompanionBuilder =
    SchoolItemsCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<String> email,
      Value<String> website,
      Value<String> phoneNumber,
      Value<DateTime> cachedAt,
    });

class $$SchoolItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolItemsTable> {
  $$SchoolItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchoolItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolItemsTable> {
  $$SchoolItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchoolItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolItemsTable> {
  $$SchoolItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$SchoolItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolItemsTable,
          SchoolItem,
          $$SchoolItemsTableFilterComposer,
          $$SchoolItemsTableOrderingComposer,
          $$SchoolItemsTableAnnotationComposer,
          $$SchoolItemsTableCreateCompanionBuilder,
          $$SchoolItemsTableUpdateCompanionBuilder,
          (
            SchoolItem,
            BaseReferences<_$AppDatabase, $SchoolItemsTable, SchoolItem>,
          ),
          SchoolItem,
          PrefetchHooks Function()
        > {
  $$SchoolItemsTableTableManager(_$AppDatabase db, $SchoolItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> website = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => SchoolItemsCompanion(
                id: id,
                name: name,
                email: email,
                website: website,
                phoneNumber: phoneNumber,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                required String email,
                required String website,
                required String phoneNumber,
                required DateTime cachedAt,
              }) => SchoolItemsCompanion.insert(
                id: id,
                name: name,
                email: email,
                website: website,
                phoneNumber: phoneNumber,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchoolItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolItemsTable,
      SchoolItem,
      $$SchoolItemsTableFilterComposer,
      $$SchoolItemsTableOrderingComposer,
      $$SchoolItemsTableAnnotationComposer,
      $$SchoolItemsTableCreateCompanionBuilder,
      $$SchoolItemsTableUpdateCompanionBuilder,
      (
        SchoolItem,
        BaseReferences<_$AppDatabase, $SchoolItemsTable, SchoolItem>,
      ),
      SchoolItem,
      PrefetchHooks Function()
    >;
typedef $$AnnouncementItemsTableCreateCompanionBuilder =
    AnnouncementItemsCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> message,
      required DateTime datePosted,
      required int schoolId,
      required DateTime cachedAt,
    });
typedef $$AnnouncementItemsTableUpdateCompanionBuilder =
    AnnouncementItemsCompanion Function({
      Value<int> id,
      Value<String?> title,
      Value<String?> message,
      Value<DateTime> datePosted,
      Value<int> schoolId,
      Value<DateTime> cachedAt,
    });

class $$AnnouncementItemsTableFilterComposer
    extends Composer<_$AppDatabase, $AnnouncementItemsTable> {
  $$AnnouncementItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datePosted => $composableBuilder(
    column: $table.datePosted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnnouncementItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnnouncementItemsTable> {
  $$AnnouncementItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datePosted => $composableBuilder(
    column: $table.datePosted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnnouncementItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnnouncementItemsTable> {
  $$AnnouncementItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get datePosted => $composableBuilder(
    column: $table.datePosted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$AnnouncementItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnnouncementItemsTable,
          AnnouncementItem,
          $$AnnouncementItemsTableFilterComposer,
          $$AnnouncementItemsTableOrderingComposer,
          $$AnnouncementItemsTableAnnotationComposer,
          $$AnnouncementItemsTableCreateCompanionBuilder,
          $$AnnouncementItemsTableUpdateCompanionBuilder,
          (
            AnnouncementItem,
            BaseReferences<
              _$AppDatabase,
              $AnnouncementItemsTable,
              AnnouncementItem
            >,
          ),
          AnnouncementItem,
          PrefetchHooks Function()
        > {
  $$AnnouncementItemsTableTableManager(
    _$AppDatabase db,
    $AnnouncementItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnnouncementItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnnouncementItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnnouncementItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<DateTime> datePosted = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => AnnouncementItemsCompanion(
                id: id,
                title: title,
                message: message,
                datePosted: datePosted,
                schoolId: schoolId,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> message = const Value.absent(),
                required DateTime datePosted,
                required int schoolId,
                required DateTime cachedAt,
              }) => AnnouncementItemsCompanion.insert(
                id: id,
                title: title,
                message: message,
                datePosted: datePosted,
                schoolId: schoolId,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnnouncementItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnnouncementItemsTable,
      AnnouncementItem,
      $$AnnouncementItemsTableFilterComposer,
      $$AnnouncementItemsTableOrderingComposer,
      $$AnnouncementItemsTableAnnotationComposer,
      $$AnnouncementItemsTableCreateCompanionBuilder,
      $$AnnouncementItemsTableUpdateCompanionBuilder,
      (
        AnnouncementItem,
        BaseReferences<
          _$AppDatabase,
          $AnnouncementItemsTable,
          AnnouncementItem
        >,
      ),
      AnnouncementItem,
      PrefetchHooks Function()
    >;
typedef $$CafeteriaItemsTableCreateCompanionBuilder =
    CafeteriaItemsCompanion Function({
      Value<int> id,
      required int category,
      required String name,
      required String description,
      required String iconName,
      required int menuId,
      required DateTime cachedAt,
    });
typedef $$CafeteriaItemsTableUpdateCompanionBuilder =
    CafeteriaItemsCompanion Function({
      Value<int> id,
      Value<int> category,
      Value<String> name,
      Value<String> description,
      Value<String> iconName,
      Value<int> menuId,
      Value<DateTime> cachedAt,
    });

class $$CafeteriaItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CafeteriaItemsTable> {
  $$CafeteriaItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get menuId => $composableBuilder(
    column: $table.menuId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CafeteriaItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CafeteriaItemsTable> {
  $$CafeteriaItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get menuId => $composableBuilder(
    column: $table.menuId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CafeteriaItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CafeteriaItemsTable> {
  $$CafeteriaItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<int> get menuId =>
      $composableBuilder(column: $table.menuId, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CafeteriaItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CafeteriaItemsTable,
          CafeteriaItem,
          $$CafeteriaItemsTableFilterComposer,
          $$CafeteriaItemsTableOrderingComposer,
          $$CafeteriaItemsTableAnnotationComposer,
          $$CafeteriaItemsTableCreateCompanionBuilder,
          $$CafeteriaItemsTableUpdateCompanionBuilder,
          (
            CafeteriaItem,
            BaseReferences<_$AppDatabase, $CafeteriaItemsTable, CafeteriaItem>,
          ),
          CafeteriaItem,
          PrefetchHooks Function()
        > {
  $$CafeteriaItemsTableTableManager(
    _$AppDatabase db,
    $CafeteriaItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CafeteriaItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CafeteriaItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CafeteriaItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> category = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconName = const Value.absent(),
                Value<int> menuId = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CafeteriaItemsCompanion(
                id: id,
                category: category,
                name: name,
                description: description,
                iconName: iconName,
                menuId: menuId,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int category,
                required String name,
                required String description,
                required String iconName,
                required int menuId,
                required DateTime cachedAt,
              }) => CafeteriaItemsCompanion.insert(
                id: id,
                category: category,
                name: name,
                description: description,
                iconName: iconName,
                menuId: menuId,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CafeteriaItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CafeteriaItemsTable,
      CafeteriaItem,
      $$CafeteriaItemsTableFilterComposer,
      $$CafeteriaItemsTableOrderingComposer,
      $$CafeteriaItemsTableAnnotationComposer,
      $$CafeteriaItemsTableCreateCompanionBuilder,
      $$CafeteriaItemsTableUpdateCompanionBuilder,
      (
        CafeteriaItem,
        BaseReferences<_$AppDatabase, $CafeteriaItemsTable, CafeteriaItem>,
      ),
      CafeteriaItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NewsItemsTableTableManager get newsItems =>
      $$NewsItemsTableTableManager(_db, _db.newsItems);
  $$EventItemsTableTableManager get eventItems =>
      $$EventItemsTableTableManager(_db, _db.eventItems);
  $$SchoolItemsTableTableManager get schoolItems =>
      $$SchoolItemsTableTableManager(_db, _db.schoolItems);
  $$AnnouncementItemsTableTableManager get announcementItems =>
      $$AnnouncementItemsTableTableManager(_db, _db.announcementItems);
  $$CafeteriaItemsTableTableManager get cafeteriaItems =>
      $$CafeteriaItemsTableTableManager(_db, _db.cafeteriaItems);
}
