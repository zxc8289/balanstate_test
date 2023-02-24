import 'dart:io';

import 'package:balanstate_test/model/product2.dart';
import 'package:balanstate_test/model/product.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// private 값까지 불러올 수 있다.
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Product,
    Product2,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createProduct(ProductCompanion data) =>
      into(product).insert(data);

  Future<int> createProduct2(Product2Companion data) =>
      into(product2).insert(data);

  Stream<List<ProductData>> watchProducts() => select(product).watch();

  removeProduct(int id) =>
      (delete(product)..where((tbl) => tbl.id.equals(id))).go();

  removeProduct2(int id) =>
      (delete(product2)..where((tbl) => tbl.id.equals(id))).go();

  // 업데이트
  Future<int> updateProductById(int id, ProductCompanion data) =>
      (update(product)..where((tbl) => tbl.id.equals(id))).write(data);

  Future<ProductData> getProductById(int id) => (select(product)..where((tbl) => tbl.id.equals(id))).getSingle();


  Future<List<ProductData>> Barcode(int barcode) {
    final query = select(product);
    query.where((tbl) => tbl.productBarcode.equals(barcode));
    return query.get();

    // select(product2).where((tbl) => tbl.date.equals(date)).watch();
  }

  Stream<List<Product2Data>> watchProducts2(DateTime date, String mealtime) {
    final query = select(product2);
    query.where((tbl) => tbl.date.equals(date));
    query.where((tbl) => tbl.mealTime.equals(mealtime));
    return query.watch();

    // select(product2).where((tbl) => tbl.date.equals(date)).watch();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
