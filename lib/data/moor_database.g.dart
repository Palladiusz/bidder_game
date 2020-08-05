// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Record extends DataClass implements Insertable<Record> {
  final int id;
  final DateTime date;
  final bool isWin;
  final int bidAmount;
  final int winChance;
  final int coinsBeforeMatch;
  final int coinsAfterMatch;
  final int coinsChangeAmount;
  Record(
      {@required this.id,
      @required this.date,
      @required this.isWin,
      @required this.bidAmount,
      @required this.winChance,
      @required this.coinsBeforeMatch,
      @required this.coinsAfterMatch,
      @required this.coinsChangeAmount});
  factory Record.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Record(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      isWin: boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_win']),
      bidAmount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}bid_amount']),
      winChance:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}win_chance']),
      coinsBeforeMatch: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}coins_before_match']),
      coinsAfterMatch: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}coins_after_match']),
      coinsChangeAmount: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}coins_change_amount']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || isWin != null) {
      map['is_win'] = Variable<bool>(isWin);
    }
    if (!nullToAbsent || bidAmount != null) {
      map['bid_amount'] = Variable<int>(bidAmount);
    }
    if (!nullToAbsent || winChance != null) {
      map['win_chance'] = Variable<int>(winChance);
    }
    if (!nullToAbsent || coinsBeforeMatch != null) {
      map['coins_before_match'] = Variable<int>(coinsBeforeMatch);
    }
    if (!nullToAbsent || coinsAfterMatch != null) {
      map['coins_after_match'] = Variable<int>(coinsAfterMatch);
    }
    if (!nullToAbsent || coinsChangeAmount != null) {
      map['coins_change_amount'] = Variable<int>(coinsChangeAmount);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      isWin:
          isWin == null && nullToAbsent ? const Value.absent() : Value(isWin),
      bidAmount: bidAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(bidAmount),
      winChance: winChance == null && nullToAbsent
          ? const Value.absent()
          : Value(winChance),
      coinsBeforeMatch: coinsBeforeMatch == null && nullToAbsent
          ? const Value.absent()
          : Value(coinsBeforeMatch),
      coinsAfterMatch: coinsAfterMatch == null && nullToAbsent
          ? const Value.absent()
          : Value(coinsAfterMatch),
      coinsChangeAmount: coinsChangeAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(coinsChangeAmount),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      isWin: serializer.fromJson<bool>(json['isWin']),
      bidAmount: serializer.fromJson<int>(json['bidAmount']),
      winChance: serializer.fromJson<int>(json['winChance']),
      coinsBeforeMatch: serializer.fromJson<int>(json['coinsBeforeMatch']),
      coinsAfterMatch: serializer.fromJson<int>(json['coinsAfterMatch']),
      coinsChangeAmount: serializer.fromJson<int>(json['coinsChangeAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'isWin': serializer.toJson<bool>(isWin),
      'bidAmount': serializer.toJson<int>(bidAmount),
      'winChance': serializer.toJson<int>(winChance),
      'coinsBeforeMatch': serializer.toJson<int>(coinsBeforeMatch),
      'coinsAfterMatch': serializer.toJson<int>(coinsAfterMatch),
      'coinsChangeAmount': serializer.toJson<int>(coinsChangeAmount),
    };
  }

  Record copyWith(
          {int id,
          DateTime date,
          bool isWin,
          int bidAmount,
          int winChance,
          int coinsBeforeMatch,
          int coinsAfterMatch,
          int coinsChangeAmount}) =>
      Record(
        id: id ?? this.id,
        date: date ?? this.date,
        isWin: isWin ?? this.isWin,
        bidAmount: bidAmount ?? this.bidAmount,
        winChance: winChance ?? this.winChance,
        coinsBeforeMatch: coinsBeforeMatch ?? this.coinsBeforeMatch,
        coinsAfterMatch: coinsAfterMatch ?? this.coinsAfterMatch,
        coinsChangeAmount: coinsChangeAmount ?? this.coinsChangeAmount,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('isWin: $isWin, ')
          ..write('bidAmount: $bidAmount, ')
          ..write('winChance: $winChance, ')
          ..write('coinsBeforeMatch: $coinsBeforeMatch, ')
          ..write('coinsAfterMatch: $coinsAfterMatch, ')
          ..write('coinsChangeAmount: $coinsChangeAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(
              isWin.hashCode,
              $mrjc(
                  bidAmount.hashCode,
                  $mrjc(
                      winChance.hashCode,
                      $mrjc(
                          coinsBeforeMatch.hashCode,
                          $mrjc(coinsAfterMatch.hashCode,
                              coinsChangeAmount.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.date == this.date &&
          other.isWin == this.isWin &&
          other.bidAmount == this.bidAmount &&
          other.winChance == this.winChance &&
          other.coinsBeforeMatch == this.coinsBeforeMatch &&
          other.coinsAfterMatch == this.coinsAfterMatch &&
          other.coinsChangeAmount == this.coinsChangeAmount);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<bool> isWin;
  final Value<int> bidAmount;
  final Value<int> winChance;
  final Value<int> coinsBeforeMatch;
  final Value<int> coinsAfterMatch;
  final Value<int> coinsChangeAmount;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.isWin = const Value.absent(),
    this.bidAmount = const Value.absent(),
    this.winChance = const Value.absent(),
    this.coinsBeforeMatch = const Value.absent(),
    this.coinsAfterMatch = const Value.absent(),
    this.coinsChangeAmount = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required bool isWin,
    @required int bidAmount,
    @required int winChance,
    @required int coinsBeforeMatch,
    @required int coinsAfterMatch,
    @required int coinsChangeAmount,
  })  : date = Value(date),
        isWin = Value(isWin),
        bidAmount = Value(bidAmount),
        winChance = Value(winChance),
        coinsBeforeMatch = Value(coinsBeforeMatch),
        coinsAfterMatch = Value(coinsAfterMatch),
        coinsChangeAmount = Value(coinsChangeAmount);
  static Insertable<Record> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<bool> isWin,
    Expression<int> bidAmount,
    Expression<int> winChance,
    Expression<int> coinsBeforeMatch,
    Expression<int> coinsAfterMatch,
    Expression<int> coinsChangeAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (isWin != null) 'is_win': isWin,
      if (bidAmount != null) 'bid_amount': bidAmount,
      if (winChance != null) 'win_chance': winChance,
      if (coinsBeforeMatch != null) 'coins_before_match': coinsBeforeMatch,
      if (coinsAfterMatch != null) 'coins_after_match': coinsAfterMatch,
      if (coinsChangeAmount != null) 'coins_change_amount': coinsChangeAmount,
    });
  }

  RecordsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<bool> isWin,
      Value<int> bidAmount,
      Value<int> winChance,
      Value<int> coinsBeforeMatch,
      Value<int> coinsAfterMatch,
      Value<int> coinsChangeAmount}) {
    return RecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      isWin: isWin ?? this.isWin,
      bidAmount: bidAmount ?? this.bidAmount,
      winChance: winChance ?? this.winChance,
      coinsBeforeMatch: coinsBeforeMatch ?? this.coinsBeforeMatch,
      coinsAfterMatch: coinsAfterMatch ?? this.coinsAfterMatch,
      coinsChangeAmount: coinsChangeAmount ?? this.coinsChangeAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isWin.present) {
      map['is_win'] = Variable<bool>(isWin.value);
    }
    if (bidAmount.present) {
      map['bid_amount'] = Variable<int>(bidAmount.value);
    }
    if (winChance.present) {
      map['win_chance'] = Variable<int>(winChance.value);
    }
    if (coinsBeforeMatch.present) {
      map['coins_before_match'] = Variable<int>(coinsBeforeMatch.value);
    }
    if (coinsAfterMatch.present) {
      map['coins_after_match'] = Variable<int>(coinsAfterMatch.value);
    }
    if (coinsChangeAmount.present) {
      map['coins_change_amount'] = Variable<int>(coinsChangeAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('isWin: $isWin, ')
          ..write('bidAmount: $bidAmount, ')
          ..write('winChance: $winChance, ')
          ..write('coinsBeforeMatch: $coinsBeforeMatch, ')
          ..write('coinsAfterMatch: $coinsAfterMatch, ')
          ..write('coinsChangeAmount: $coinsChangeAmount')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  final GeneratedDatabase _db;
  final String _alias;
  $RecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isWinMeta = const VerificationMeta('isWin');
  GeneratedBoolColumn _isWin;
  @override
  GeneratedBoolColumn get isWin => _isWin ??= _constructIsWin();
  GeneratedBoolColumn _constructIsWin() {
    return GeneratedBoolColumn(
      'is_win',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bidAmountMeta = const VerificationMeta('bidAmount');
  GeneratedIntColumn _bidAmount;
  @override
  GeneratedIntColumn get bidAmount => _bidAmount ??= _constructBidAmount();
  GeneratedIntColumn _constructBidAmount() {
    return GeneratedIntColumn(
      'bid_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _winChanceMeta = const VerificationMeta('winChance');
  GeneratedIntColumn _winChance;
  @override
  GeneratedIntColumn get winChance => _winChance ??= _constructWinChance();
  GeneratedIntColumn _constructWinChance() {
    return GeneratedIntColumn(
      'win_chance',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coinsBeforeMatchMeta =
      const VerificationMeta('coinsBeforeMatch');
  GeneratedIntColumn _coinsBeforeMatch;
  @override
  GeneratedIntColumn get coinsBeforeMatch =>
      _coinsBeforeMatch ??= _constructCoinsBeforeMatch();
  GeneratedIntColumn _constructCoinsBeforeMatch() {
    return GeneratedIntColumn(
      'coins_before_match',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coinsAfterMatchMeta =
      const VerificationMeta('coinsAfterMatch');
  GeneratedIntColumn _coinsAfterMatch;
  @override
  GeneratedIntColumn get coinsAfterMatch =>
      _coinsAfterMatch ??= _constructCoinsAfterMatch();
  GeneratedIntColumn _constructCoinsAfterMatch() {
    return GeneratedIntColumn(
      'coins_after_match',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coinsChangeAmountMeta =
      const VerificationMeta('coinsChangeAmount');
  GeneratedIntColumn _coinsChangeAmount;
  @override
  GeneratedIntColumn get coinsChangeAmount =>
      _coinsChangeAmount ??= _constructCoinsChangeAmount();
  GeneratedIntColumn _constructCoinsChangeAmount() {
    return GeneratedIntColumn(
      'coins_change_amount',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        isWin,
        bidAmount,
        winChance,
        coinsBeforeMatch,
        coinsAfterMatch,
        coinsChangeAmount
      ];
  @override
  $RecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'records';
  @override
  final String actualTableName = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_win')) {
      context.handle(
          _isWinMeta, isWin.isAcceptableOrUnknown(data['is_win'], _isWinMeta));
    } else if (isInserting) {
      context.missing(_isWinMeta);
    }
    if (data.containsKey('bid_amount')) {
      context.handle(_bidAmountMeta,
          bidAmount.isAcceptableOrUnknown(data['bid_amount'], _bidAmountMeta));
    } else if (isInserting) {
      context.missing(_bidAmountMeta);
    }
    if (data.containsKey('win_chance')) {
      context.handle(_winChanceMeta,
          winChance.isAcceptableOrUnknown(data['win_chance'], _winChanceMeta));
    } else if (isInserting) {
      context.missing(_winChanceMeta);
    }
    if (data.containsKey('coins_before_match')) {
      context.handle(
          _coinsBeforeMatchMeta,
          coinsBeforeMatch.isAcceptableOrUnknown(
              data['coins_before_match'], _coinsBeforeMatchMeta));
    } else if (isInserting) {
      context.missing(_coinsBeforeMatchMeta);
    }
    if (data.containsKey('coins_after_match')) {
      context.handle(
          _coinsAfterMatchMeta,
          coinsAfterMatch.isAcceptableOrUnknown(
              data['coins_after_match'], _coinsAfterMatchMeta));
    } else if (isInserting) {
      context.missing(_coinsAfterMatchMeta);
    }
    if (data.containsKey('coins_change_amount')) {
      context.handle(
          _coinsChangeAmountMeta,
          coinsChangeAmount.isAcceptableOrUnknown(
              data['coins_change_amount'], _coinsChangeAmountMeta));
    } else if (isInserting) {
      context.missing(_coinsChangeAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Record.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RecordsTable _records;
  $RecordsTable get records => _records ??= $RecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [records];
}
