import 'package:balanstate_test/componnent/custom_text_field.dart';
import 'package:balanstate_test/const/const.dart';
import 'package:balanstate_test/database/drift_database.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductInformation extends StatefulWidget {
  final String barcode;
  final DateTime date;
  final String mealTime;
  final int? productId;

  const ProductInformation(
      {this.productId,
      required this.mealTime,
      required this.date,
      required this.barcode,
      Key? key})
      : super(key: key);

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late Product product = Product();
  var productKcal;

  // 제품 정보 저장
  int? productBarcode;
  String? productName;
  int? productGramNumber;
  double? productEnergy;
  double? productCarbo;
  double? productProteins;
  double? productFat;

  void initState() {
    fetchProduct(widget.barcode);
    super.initState();
  }

  Future<void> fetchProduct(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );

    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);
    if (result.status == ProductResultV3.statusSuccess) {
      setState(() {
        if (product != null) {
          product = result.product!;
          productKcal =
              product.nutriments?.getComputedKJ(PerSize.oneHundredGrams);
          if (productKcal != null) {
            productKcal = productKcal / 4.184;
            productKcal = productKcal.floor();
          }
        }
      });
    }

    // if (result.status != ProductResultV3.statusSuccess) {
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F4E75),
              Color(0xFF358580),
            ],
          ),
        ),
        child: FutureBuilder<ProductData>(
          future: null,
          builder: (context, snapshot) {
            return SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 45, right: 45),
                    child: Column(
                      children: [
                        // 설정
                        _Setting(),
                        SizedBox(height: 37.0),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create product',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // Content
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: 'Barcode',
                                tf: true,
                                unit: '',
                                productingredients: '${product?.barcode ?? ''}',
                                onSaved: (String? val) {
                                  productBarcode = int.parse(val!);
                                },
                                // initialValue: productBarcode?.toString() ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: 'Product name',
                                tf: false,
                                unit: '',
                                productingredients: '${product?.productName ?? ''}',
                                onSaved: (String? val) {
                                  productName = val!;
                                },
                                // initialValue: productName ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: '100 gram',
                                tf: true,
                                unit: 'number',
                                productingredients: '1',
                                onSaved: (String? val) {
                                  productGramNumber = int.parse(val!);
                                },
                                // initialValue: productGramNumber.toString() ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: 'Energy',
                                tf: true,
                                unit: 'kcal',
                                productingredients: '${productKcal ?? ''}',
                                onSaved: (String? val) {
                                  productEnergy = double.parse(val!);
                                },
                                // initialValue: productEnergy.toString() ?? '',
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              CustomTextField(
                                label: 'Carbohydrates',
                                tf: true,
                                unit: 'g',
                                productingredients:
                                    '${product?.nutriments?.getValue(Nutrient.carbohydrates!, PerSize.oneHundredGrams!) ?? ''}',
                                onSaved: (String? val) {
                                  productCarbo = double.parse(val!);
                                },
                                // initialValue: productCarbo.toString() ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: 'Proteins',
                                tf: true,
                                unit: 'g',
                                productingredients:
                                    '${product?.nutriments?.getValue(Nutrient.proteins!, PerSize.oneHundredGrams!) ?? ''}',
                                onSaved: (String? val) {
                                  productProteins = double.parse(val!);
                                },
                                // initialValue: productProteins.toString() ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextField(
                                label: 'Fat',
                                tf: true,
                                unit: 'g',
                                productingredients:
                                    '${product?.nutriments?.getValue(Nutrient.fat!, PerSize.oneHundredGrams!) ?? ''}',
                                onSaved: (String? val) {
                                  productFat = double.parse(val!);
                                },
                                // initialValue: productFat.toString() ?? '',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              _SaveButton(
                                onPressed: onSavePressed,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void onSavePressed() async {
    // formKey는 생성을 했는데
    // Form 위젯과 결합을 안했을때
    if (formKey.currentState == null) {
      print('에러');
      return;
    }

    if (formKey.currentState!.validate()) {
      // print(widget.date);
      // print(widget.mealTime);
      // print(productBarcode!);
      // print(productName!);
      // print(productGramNumber!);
      // print(productKcal!);
      // print(productCarbo!);
      // print(productProteins!);
      // print(productFat!);

      formKey.currentState!.save();
      final test = await GetIt.I<LocalDatabase>().Barcode(productBarcode!);

      if (test.isEmpty) {
        if (widget.productId == null) {
          final key = await GetIt.I<LocalDatabase>().createProduct(
            ProductCompanion(
              date: Value(widget.date),
              mealTime: Value(widget.mealTime),
              productBarcode: Value(productBarcode!),
              productName: Value(productName!),
              productGramCount: Value(productGramNumber!),
              productKcal: Value(productKcal!),
              productCarbs: Value(productCarbo!),
              productProteins: Value(productProteins!),
              productFat: Value(productFat!),
            ),
          );
        } else {
          await GetIt.I<LocalDatabase>().updateProductById(
            widget.productId!,
            ProductCompanion(
              date: Value(widget.date),
              mealTime: Value(widget.mealTime),
              productBarcode: Value(productBarcode!),
              productName: Value(productName!),
              productGramCount: Value(productGramNumber!),
              productKcal: Value(productKcal!),
              productCarbs: Value(productCarbo!),
              productProteins: Value(productProteins!),
              productFat: Value(productFat!),
            ),
          );
        }
      }

      final key2 = await GetIt.I<LocalDatabase>().createProduct2(
        Product2Companion(
          date: Value(widget.date),
          mealTime: Value(widget.mealTime),
          productBarcode: Value(productBarcode!),
          productName: Value(productName!),
          productGramCount: Value(productGramNumber!),
          productKcal: Value(productKcal!),
          productCarbs: Value(productCarbo!),
          productProteins: Value(productProteins!),
          productFat: Value(productFat!),
        ),
      );

      print('Save 완료 $key2');

      Navigator.of(context).pop();
    }
  }
}

// 설정
class _Setting extends StatelessWidget {
  const _Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
            size: 38,
          ),
        )
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: PRIMARY_COLOR,
            ),
            child: Text(
              '저장',
            ),
          ),
        ),
      ],
    );
  }
}
