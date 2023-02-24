import 'package:balanstate_test/componnent/%20product_information.dart';
import 'package:balanstate_test/componnent/product_bottom_sheet.dart';
import 'package:balanstate_test/componnent/product_card.dart';
import 'package:balanstate_test/const/const.dart';
import 'package:balanstate_test/database/drift_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:path/path.dart' as Path;

class BarCodeScreen extends StatefulWidget {
  final DateTime date;
  final String mealTime;

  const BarCodeScreen({required this.mealTime, required this.date, Key? key})
      : super(key: key);

  @override
  State<BarCodeScreen> createState() => _BarCodeScreenState();
}

class _BarCodeScreenState extends State<BarCodeScreen> {
  String barcode = 'Unknown';
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      barcode = barcodeScanRes;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ProductInformation(
              barcode: barcode, date: widget.date, mealTime: widget.mealTime, productId: null,);
        },
      ),
    );
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
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 45, right: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 설정
                _Setting(),
                SizedBox(height: 37.0),
                Text(
                  'Search food products',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                    onPressed: () => {
                          scanBarcodeNormal(),
                        },
                    style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                    ),
                    child: Text('Start barcode scan')),
                // Text('Scan result : $barcode\n',
                //     style: TextStyle(fontSize: 20)
                // ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 300,
                  child: StreamBuilder<List<ProductData>>(
                      stream: GetIt.I<LocalDatabase>().watchProducts(),
                      builder: (context, snapshot) {
                        List<ProductData> products = [];
                        if (snapshot.hasData) {
                          products = snapshot.data!;
                        }
                        return ListView.separated(
                          itemCount: products.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 8.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            final product = products[index];

                            return Dismissible(
                              key: ObjectKey(product.id),
                              direction: DismissDirection.endToStart,
                              onDismissed: (DismissDirection direction) {
                                GetIt.I<LocalDatabase>()
                                    .removeProduct(product.id);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Hearder
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return ProductInformation(
                                                  barcode: barcode,
                                                  date: widget.date,
                                                  mealTime: widget.mealTime,
                                                  productId: product.id,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: ProductCard(
                                          productName: product.productName,
                                          productKcal: product.productKcal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Conten
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
