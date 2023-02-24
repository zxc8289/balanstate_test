
import 'package:balanstate_test/componnent/product_card.dart';
import 'package:balanstate_test/database/drift_database.dart';
import 'package:balanstate_test/screen/barcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class Meal extends StatelessWidget {
  final String mealTime;
  final DateTime date;
  const Meal({required this.date, required this.mealTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.restaurant,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        mealTime,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StreamBuilder<List<Product2Data>>(
                          stream: GetIt.I<LocalDatabase>()
                              .watchProducts2(date, mealTime),
                          builder: (context, snapshot) {
                            List<Product2Data> products = [];
                            double productsKcalSum = 0;
                            if (snapshot.hasData) {
                              products = snapshot.data!;
                            }

                            for (int i = 0; i < products.length; i++) {
                              productsKcalSum += products[i].productKcal;
                            }

                            return Text(
                              '$productsKcalSum kcal',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            );
                          }),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 260,
                child: StreamBuilder<List<Product2Data>>(
                    stream:
                        GetIt.I<LocalDatabase>().watchProducts2(date, mealTime),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData && snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            'No meals inforamtion',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1.0,
                          );
                        },
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];

                          return Dismissible(
                            key: ObjectKey(product.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (DismissDirection direction) {
                              GetIt.I<LocalDatabase>()
                                  .removeProduct2(product.id);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Hearder
                                Column(
                                  children: [
                                    ProductCard(
                                      productName: product.productName,
                                      productKcal: product.productKcal,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return BarCodeScreen(
                              date: date,
                              mealTime: mealTime,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
