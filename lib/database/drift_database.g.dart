// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final DateTime date;
  final String mealTime;
  final int productBarcode;
  final String productName;
  final int productGramCount;
  final int productKcal;
  final double productCarbs;
  final double productProteins;
  final double productFat;
  final DateTime createdAt;
  ProductData(
      {required this.id,
      required this.date,
      required this.mealTime,
      required this.productBarcode,
      required this.productName,
      required this.productGramCount,
      required this.productKcal,
      required this.productCarbs,
      required this.productProteins,
      required this.productFat,
      required this.createdAt});
  factory ProductData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      mealTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_time'])!,
      productBarcode: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_barcode'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      productGramCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}product_gram_count'])!,
      productKcal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_kcal'])!,
      productCarbs: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_carbs'])!,
      productProteins: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_proteins'])!,
      productFat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_fat'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['meal_time'] = Variable<String>(mealTime);
    map['product_barcode'] = Variable<int>(productBarcode);
    map['product_name'] = Variable<String>(productName);
    map['product_gram_count'] = Variable<int>(productGramCount);
    map['product_kcal'] = Variable<int>(productKcal);
    map['product_carbs'] = Variable<double>(productCarbs);
    map['product_proteins'] = Variable<double>(productProteins);
    map['product_fat'] = Variable<double>(productFat);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      date: Value(date),
      mealTime: Value(mealTime),
      productBarcode: Value(productBarcode),
      productName: Value(productName),
      productGramCount: Value(productGramCount),
      productKcal: Value(productKcal),
      productCarbs: Value(productCarbs),
      productProteins: Value(productProteins),
      productFat: Value(productFat),
      createdAt: Value(createdAt),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealTime: serializer.fromJson<String>(json['mealTime']),
      productBarcode: serializer.fromJson<int>(json['productBarcode']),
      productName: serializer.fromJson<String>(json['productName']),
      productGramCount: serializer.fromJson<int>(json['productGramCount']),
      productKcal: serializer.fromJson<int>(json['productKcal']),
      productCarbs: serializer.fromJson<double>(json['productCarbs']),
      productProteins: serializer.fromJson<double>(json['productProteins']),
      productFat: serializer.fromJson<double>(json['productFat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'mealTime': serializer.toJson<String>(mealTime),
      'productBarcode': serializer.toJson<int>(productBarcode),
      'productName': serializer.toJson<String>(productName),
      'productGramCount': serializer.toJson<int>(productGramCount),
      'productKcal': serializer.toJson<int>(productKcal),
      'productCarbs': serializer.toJson<double>(productCarbs),
      'productProteins': serializer.toJson<double>(productProteins),
      'productFat': serializer.toJson<double>(productFat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProductData copyWith(
          {int? id,
          DateTime? date,
          String? mealTime,
          int? productBarcode,
          String? productName,
          int? productGramCount,
          int? productKcal,
          double? productCarbs,
          double? productProteins,
          double? productFat,
          DateTime? createdAt}) =>
      ProductData(
        id: id ?? this.id,
        date: date ?? this.date,
        mealTime: mealTime ?? this.mealTime,
        productBarcode: productBarcode ?? this.productBarcode,
        productName: productName ?? this.productName,
        productGramCount: productGramCount ?? this.productGramCount,
        productKcal: productKcal ?? this.productKcal,
        productCarbs: productCarbs ?? this.productCarbs,
        productProteins: productProteins ?? this.productProteins,
        productFat: productFat ?? this.productFat,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('productName: $productName, ')
          ..write('productGramCount: $productGramCount, ')
          ..write('productKcal: $productKcal, ')
          ..write('productCarbs: $productCarbs, ')
          ..write('productProteins: $productProteins, ')
          ..write('productFat: $productFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      mealTime,
      productBarcode,
      productName,
      productGramCount,
      productKcal,
      productCarbs,
      productProteins,
      productFat,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.date == this.date &&
          other.mealTime == this.mealTime &&
          other.productBarcode == this.productBarcode &&
          other.productName == this.productName &&
          other.productGramCount == this.productGramCount &&
          other.productKcal == this.productKcal &&
          other.productCarbs == this.productCarbs &&
          other.productProteins == this.productProteins &&
          other.productFat == this.productFat &&
          other.createdAt == this.createdAt);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> mealTime;
  final Value<int> productBarcode;
  final Value<String> productName;
  final Value<int> productGramCount;
  final Value<int> productKcal;
  final Value<double> productCarbs;
  final Value<double> productProteins;
  final Value<double> productFat;
  final Value<DateTime> createdAt;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mealTime = const Value.absent(),
    this.productBarcode = const Value.absent(),
    this.productName = const Value.absent(),
    this.productGramCount = const Value.absent(),
    this.productKcal = const Value.absent(),
    this.productCarbs = const Value.absent(),
    this.productProteins = const Value.absent(),
    this.productFat = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String mealTime,
    required int productBarcode,
    required String productName,
    required int productGramCount,
    required int productKcal,
    required double productCarbs,
    required double productProteins,
    required double productFat,
    this.createdAt = const Value.absent(),
  })  : date = Value(date),
        mealTime = Value(mealTime),
        productBarcode = Value(productBarcode),
        productName = Value(productName),
        productGramCount = Value(productGramCount),
        productKcal = Value(productKcal),
        productCarbs = Value(productCarbs),
        productProteins = Value(productProteins),
        productFat = Value(productFat);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? mealTime,
    Expression<int>? productBarcode,
    Expression<String>? productName,
    Expression<int>? productGramCount,
    Expression<int>? productKcal,
    Expression<double>? productCarbs,
    Expression<double>? productProteins,
    Expression<double>? productFat,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mealTime != null) 'meal_time': mealTime,
      if (productBarcode != null) 'product_barcode': productBarcode,
      if (productName != null) 'product_name': productName,
      if (productGramCount != null) 'product_gram_count': productGramCount,
      if (productKcal != null) 'product_kcal': productKcal,
      if (productCarbs != null) 'product_carbs': productCarbs,
      if (productProteins != null) 'product_proteins': productProteins,
      if (productFat != null) 'product_fat': productFat,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? mealTime,
      Value<int>? productBarcode,
      Value<String>? productName,
      Value<int>? productGramCount,
      Value<int>? productKcal,
      Value<double>? productCarbs,
      Value<double>? productProteins,
      Value<double>? productFat,
      Value<DateTime>? createdAt}) {
    return ProductCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      mealTime: mealTime ?? this.mealTime,
      productBarcode: productBarcode ?? this.productBarcode,
      productName: productName ?? this.productName,
      productGramCount: productGramCount ?? this.productGramCount,
      productKcal: productKcal ?? this.productKcal,
      productCarbs: productCarbs ?? this.productCarbs,
      productProteins: productProteins ?? this.productProteins,
      productFat: productFat ?? this.productFat,
      createdAt: createdAt ?? this.createdAt,
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
    if (mealTime.present) {
      map['meal_time'] = Variable<String>(mealTime.value);
    }
    if (productBarcode.present) {
      map['product_barcode'] = Variable<int>(productBarcode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productGramCount.present) {
      map['product_gram_count'] = Variable<int>(productGramCount.value);
    }
    if (productKcal.present) {
      map['product_kcal'] = Variable<int>(productKcal.value);
    }
    if (productCarbs.present) {
      map['product_carbs'] = Variable<double>(productCarbs.value);
    }
    if (productProteins.present) {
      map['product_proteins'] = Variable<double>(productProteins.value);
    }
    if (productFat.present) {
      map['product_fat'] = Variable<double>(productFat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('productName: $productName, ')
          ..write('productGramCount: $productGramCount, ')
          ..write('productKcal: $productKcal, ')
          ..write('productCarbs: $productCarbs, ')
          ..write('productProteins: $productProteins, ')
          ..write('productFat: $productFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _mealTimeMeta = const VerificationMeta('mealTime');
  @override
  late final GeneratedColumn<String?> mealTime = GeneratedColumn<String?>(
      'meal_time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<int?> productBarcode = GeneratedColumn<int?>(
      'product_barcode', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productGramCountMeta =
      const VerificationMeta('productGramCount');
  @override
  late final GeneratedColumn<int?> productGramCount = GeneratedColumn<int?>(
      'product_gram_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productKcalMeta =
      const VerificationMeta('productKcal');
  @override
  late final GeneratedColumn<int?> productKcal = GeneratedColumn<int?>(
      'product_kcal', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productCarbsMeta =
      const VerificationMeta('productCarbs');
  @override
  late final GeneratedColumn<double?> productCarbs = GeneratedColumn<double?>(
      'product_carbs', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _productProteinsMeta =
      const VerificationMeta('productProteins');
  @override
  late final GeneratedColumn<double?> productProteins =
      GeneratedColumn<double?>('product_proteins', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _productFatMeta = const VerificationMeta('productFat');
  @override
  late final GeneratedColumn<double?> productFat = GeneratedColumn<double?>(
      'product_fat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        mealTime,
        productBarcode,
        productName,
        productGramCount,
        productKcal,
        productCarbs,
        productProteins,
        productFat,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? 'product';
  @override
  String get actualTableName => 'product';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_time')) {
      context.handle(_mealTimeMeta,
          mealTime.isAcceptableOrUnknown(data['meal_time']!, _mealTimeMeta));
    } else if (isInserting) {
      context.missing(_mealTimeMeta);
    }
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_gram_count')) {
      context.handle(
          _productGramCountMeta,
          productGramCount.isAcceptableOrUnknown(
              data['product_gram_count']!, _productGramCountMeta));
    } else if (isInserting) {
      context.missing(_productGramCountMeta);
    }
    if (data.containsKey('product_kcal')) {
      context.handle(
          _productKcalMeta,
          productKcal.isAcceptableOrUnknown(
              data['product_kcal']!, _productKcalMeta));
    } else if (isInserting) {
      context.missing(_productKcalMeta);
    }
    if (data.containsKey('product_carbs')) {
      context.handle(
          _productCarbsMeta,
          productCarbs.isAcceptableOrUnknown(
              data['product_carbs']!, _productCarbsMeta));
    } else if (isInserting) {
      context.missing(_productCarbsMeta);
    }
    if (data.containsKey('product_proteins')) {
      context.handle(
          _productProteinsMeta,
          productProteins.isAcceptableOrUnknown(
              data['product_proteins']!, _productProteinsMeta));
    } else if (isInserting) {
      context.missing(_productProteinsMeta);
    }
    if (data.containsKey('product_fat')) {
      context.handle(
          _productFatMeta,
          productFat.isAcceptableOrUnknown(
              data['product_fat']!, _productFatMeta));
    } else if (isInserting) {
      context.missing(_productFatMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class Product2Data extends DataClass implements Insertable<Product2Data> {
  final int id;
  final DateTime date;
  final String mealTime;
  final int productBarcode;
  final String productName;
  final int productGramCount;
  final int productKcal;
  final double productCarbs;
  final double productProteins;
  final double productFat;
  final DateTime createdAt;
  Product2Data(
      {required this.id,
      required this.date,
      required this.mealTime,
      required this.productBarcode,
      required this.productName,
      required this.productGramCount,
      required this.productKcal,
      required this.productCarbs,
      required this.productProteins,
      required this.productFat,
      required this.createdAt});
  factory Product2Data.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Product2Data(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      mealTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_time'])!,
      productBarcode: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_barcode'])!,
      productName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name'])!,
      productGramCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}product_gram_count'])!,
      productKcal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_kcal'])!,
      productCarbs: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_carbs'])!,
      productProteins: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_proteins'])!,
      productFat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_fat'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['meal_time'] = Variable<String>(mealTime);
    map['product_barcode'] = Variable<int>(productBarcode);
    map['product_name'] = Variable<String>(productName);
    map['product_gram_count'] = Variable<int>(productGramCount);
    map['product_kcal'] = Variable<int>(productKcal);
    map['product_carbs'] = Variable<double>(productCarbs);
    map['product_proteins'] = Variable<double>(productProteins);
    map['product_fat'] = Variable<double>(productFat);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  Product2Companion toCompanion(bool nullToAbsent) {
    return Product2Companion(
      id: Value(id),
      date: Value(date),
      mealTime: Value(mealTime),
      productBarcode: Value(productBarcode),
      productName: Value(productName),
      productGramCount: Value(productGramCount),
      productKcal: Value(productKcal),
      productCarbs: Value(productCarbs),
      productProteins: Value(productProteins),
      productFat: Value(productFat),
      createdAt: Value(createdAt),
    );
  }

  factory Product2Data.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product2Data(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealTime: serializer.fromJson<String>(json['mealTime']),
      productBarcode: serializer.fromJson<int>(json['productBarcode']),
      productName: serializer.fromJson<String>(json['productName']),
      productGramCount: serializer.fromJson<int>(json['productGramCount']),
      productKcal: serializer.fromJson<int>(json['productKcal']),
      productCarbs: serializer.fromJson<double>(json['productCarbs']),
      productProteins: serializer.fromJson<double>(json['productProteins']),
      productFat: serializer.fromJson<double>(json['productFat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'mealTime': serializer.toJson<String>(mealTime),
      'productBarcode': serializer.toJson<int>(productBarcode),
      'productName': serializer.toJson<String>(productName),
      'productGramCount': serializer.toJson<int>(productGramCount),
      'productKcal': serializer.toJson<int>(productKcal),
      'productCarbs': serializer.toJson<double>(productCarbs),
      'productProteins': serializer.toJson<double>(productProteins),
      'productFat': serializer.toJson<double>(productFat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Product2Data copyWith(
          {int? id,
          DateTime? date,
          String? mealTime,
          int? productBarcode,
          String? productName,
          int? productGramCount,
          int? productKcal,
          double? productCarbs,
          double? productProteins,
          double? productFat,
          DateTime? createdAt}) =>
      Product2Data(
        id: id ?? this.id,
        date: date ?? this.date,
        mealTime: mealTime ?? this.mealTime,
        productBarcode: productBarcode ?? this.productBarcode,
        productName: productName ?? this.productName,
        productGramCount: productGramCount ?? this.productGramCount,
        productKcal: productKcal ?? this.productKcal,
        productCarbs: productCarbs ?? this.productCarbs,
        productProteins: productProteins ?? this.productProteins,
        productFat: productFat ?? this.productFat,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Product2Data(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('productName: $productName, ')
          ..write('productGramCount: $productGramCount, ')
          ..write('productKcal: $productKcal, ')
          ..write('productCarbs: $productCarbs, ')
          ..write('productProteins: $productProteins, ')
          ..write('productFat: $productFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      mealTime,
      productBarcode,
      productName,
      productGramCount,
      productKcal,
      productCarbs,
      productProteins,
      productFat,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product2Data &&
          other.id == this.id &&
          other.date == this.date &&
          other.mealTime == this.mealTime &&
          other.productBarcode == this.productBarcode &&
          other.productName == this.productName &&
          other.productGramCount == this.productGramCount &&
          other.productKcal == this.productKcal &&
          other.productCarbs == this.productCarbs &&
          other.productProteins == this.productProteins &&
          other.productFat == this.productFat &&
          other.createdAt == this.createdAt);
}

class Product2Companion extends UpdateCompanion<Product2Data> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> mealTime;
  final Value<int> productBarcode;
  final Value<String> productName;
  final Value<int> productGramCount;
  final Value<int> productKcal;
  final Value<double> productCarbs;
  final Value<double> productProteins;
  final Value<double> productFat;
  final Value<DateTime> createdAt;
  const Product2Companion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mealTime = const Value.absent(),
    this.productBarcode = const Value.absent(),
    this.productName = const Value.absent(),
    this.productGramCount = const Value.absent(),
    this.productKcal = const Value.absent(),
    this.productCarbs = const Value.absent(),
    this.productProteins = const Value.absent(),
    this.productFat = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  Product2Companion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String mealTime,
    required int productBarcode,
    required String productName,
    required int productGramCount,
    required int productKcal,
    required double productCarbs,
    required double productProteins,
    required double productFat,
    this.createdAt = const Value.absent(),
  })  : date = Value(date),
        mealTime = Value(mealTime),
        productBarcode = Value(productBarcode),
        productName = Value(productName),
        productGramCount = Value(productGramCount),
        productKcal = Value(productKcal),
        productCarbs = Value(productCarbs),
        productProteins = Value(productProteins),
        productFat = Value(productFat);
  static Insertable<Product2Data> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? mealTime,
    Expression<int>? productBarcode,
    Expression<String>? productName,
    Expression<int>? productGramCount,
    Expression<int>? productKcal,
    Expression<double>? productCarbs,
    Expression<double>? productProteins,
    Expression<double>? productFat,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mealTime != null) 'meal_time': mealTime,
      if (productBarcode != null) 'product_barcode': productBarcode,
      if (productName != null) 'product_name': productName,
      if (productGramCount != null) 'product_gram_count': productGramCount,
      if (productKcal != null) 'product_kcal': productKcal,
      if (productCarbs != null) 'product_carbs': productCarbs,
      if (productProteins != null) 'product_proteins': productProteins,
      if (productFat != null) 'product_fat': productFat,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  Product2Companion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? mealTime,
      Value<int>? productBarcode,
      Value<String>? productName,
      Value<int>? productGramCount,
      Value<int>? productKcal,
      Value<double>? productCarbs,
      Value<double>? productProteins,
      Value<double>? productFat,
      Value<DateTime>? createdAt}) {
    return Product2Companion(
      id: id ?? this.id,
      date: date ?? this.date,
      mealTime: mealTime ?? this.mealTime,
      productBarcode: productBarcode ?? this.productBarcode,
      productName: productName ?? this.productName,
      productGramCount: productGramCount ?? this.productGramCount,
      productKcal: productKcal ?? this.productKcal,
      productCarbs: productCarbs ?? this.productCarbs,
      productProteins: productProteins ?? this.productProteins,
      productFat: productFat ?? this.productFat,
      createdAt: createdAt ?? this.createdAt,
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
    if (mealTime.present) {
      map['meal_time'] = Variable<String>(mealTime.value);
    }
    if (productBarcode.present) {
      map['product_barcode'] = Variable<int>(productBarcode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productGramCount.present) {
      map['product_gram_count'] = Variable<int>(productGramCount.value);
    }
    if (productKcal.present) {
      map['product_kcal'] = Variable<int>(productKcal.value);
    }
    if (productCarbs.present) {
      map['product_carbs'] = Variable<double>(productCarbs.value);
    }
    if (productProteins.present) {
      map['product_proteins'] = Variable<double>(productProteins.value);
    }
    if (productFat.present) {
      map['product_fat'] = Variable<double>(productFat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Product2Companion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('productBarcode: $productBarcode, ')
          ..write('productName: $productName, ')
          ..write('productGramCount: $productGramCount, ')
          ..write('productKcal: $productKcal, ')
          ..write('productCarbs: $productCarbs, ')
          ..write('productProteins: $productProteins, ')
          ..write('productFat: $productFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $Product2Table extends Product2
    with TableInfo<$Product2Table, Product2Data> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Product2Table(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _mealTimeMeta = const VerificationMeta('mealTime');
  @override
  late final GeneratedColumn<String?> mealTime = GeneratedColumn<String?>(
      'meal_time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productBarcodeMeta =
      const VerificationMeta('productBarcode');
  @override
  late final GeneratedColumn<int?> productBarcode = GeneratedColumn<int?>(
      'product_barcode', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String?> productName = GeneratedColumn<String?>(
      'product_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _productGramCountMeta =
      const VerificationMeta('productGramCount');
  @override
  late final GeneratedColumn<int?> productGramCount = GeneratedColumn<int?>(
      'product_gram_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productKcalMeta =
      const VerificationMeta('productKcal');
  @override
  late final GeneratedColumn<int?> productKcal = GeneratedColumn<int?>(
      'product_kcal', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productCarbsMeta =
      const VerificationMeta('productCarbs');
  @override
  late final GeneratedColumn<double?> productCarbs = GeneratedColumn<double?>(
      'product_carbs', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _productProteinsMeta =
      const VerificationMeta('productProteins');
  @override
  late final GeneratedColumn<double?> productProteins =
      GeneratedColumn<double?>('product_proteins', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _productFatMeta = const VerificationMeta('productFat');
  @override
  late final GeneratedColumn<double?> productFat = GeneratedColumn<double?>(
      'product_fat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        mealTime,
        productBarcode,
        productName,
        productGramCount,
        productKcal,
        productCarbs,
        productProteins,
        productFat,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? 'product2';
  @override
  String get actualTableName => 'product2';
  @override
  VerificationContext validateIntegrity(Insertable<Product2Data> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_time')) {
      context.handle(_mealTimeMeta,
          mealTime.isAcceptableOrUnknown(data['meal_time']!, _mealTimeMeta));
    } else if (isInserting) {
      context.missing(_mealTimeMeta);
    }
    if (data.containsKey('product_barcode')) {
      context.handle(
          _productBarcodeMeta,
          productBarcode.isAcceptableOrUnknown(
              data['product_barcode']!, _productBarcodeMeta));
    } else if (isInserting) {
      context.missing(_productBarcodeMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_gram_count')) {
      context.handle(
          _productGramCountMeta,
          productGramCount.isAcceptableOrUnknown(
              data['product_gram_count']!, _productGramCountMeta));
    } else if (isInserting) {
      context.missing(_productGramCountMeta);
    }
    if (data.containsKey('product_kcal')) {
      context.handle(
          _productKcalMeta,
          productKcal.isAcceptableOrUnknown(
              data['product_kcal']!, _productKcalMeta));
    } else if (isInserting) {
      context.missing(_productKcalMeta);
    }
    if (data.containsKey('product_carbs')) {
      context.handle(
          _productCarbsMeta,
          productCarbs.isAcceptableOrUnknown(
              data['product_carbs']!, _productCarbsMeta));
    } else if (isInserting) {
      context.missing(_productCarbsMeta);
    }
    if (data.containsKey('product_proteins')) {
      context.handle(
          _productProteinsMeta,
          productProteins.isAcceptableOrUnknown(
              data['product_proteins']!, _productProteinsMeta));
    } else if (isInserting) {
      context.missing(_productProteinsMeta);
    }
    if (data.containsKey('product_fat')) {
      context.handle(
          _productFatMeta,
          productFat.isAcceptableOrUnknown(
              data['product_fat']!, _productFatMeta));
    } else if (isInserting) {
      context.missing(_productFatMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product2Data map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Product2Data.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $Product2Table createAlias(String alias) {
    return $Product2Table(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProductTable product = $ProductTable(this);
  late final $Product2Table product2 = $Product2Table(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [product, product2];
}
