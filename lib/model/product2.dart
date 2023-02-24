import 'package:drift/drift.dart';

class Product2 extends Table{
  // id 값
  IntColumn get id => integer().autoIncrement()();
  // 일정 날짜
  DateTimeColumn get date => dateTime()();
  // 아침, 점심, 저녁
  TextColumn get mealTime => text()();
  // 바코드 값
  IntColumn get productBarcode => integer()();
  // 제품 이름
  TextColumn get productName => text()();
  // 제품 그램
  IntColumn get productGramCount => integer()();
  // 제품 칼로리
  IntColumn get productKcal => integer()();
  // 제품 탄수화물
  RealColumn get productCarbs => real()();
  // 제품 단백질
  RealColumn get productProteins => real()();
  // 제품 지방
  RealColumn get productFat => real()();
  // 데이터 생성 날짜
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now(), )();
}