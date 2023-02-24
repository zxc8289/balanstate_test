import 'package:balanstate_test/componnent/sleep.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class FitbitChart extends StatefulWidget {
  const FitbitChart({Key? key}) : super(key: key);

  @override
  State<FitbitChart> createState() => _FitbitChartState();
}

class _FitbitChartState extends State<FitbitChart> {
  DateTime selected = DateTime.utc(DateTime.now().year,DateTime.now().month,DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        DateTime prevDate = selected.subtract(Duration(days: 1));
                        selected = prevDate;
                      });

                    }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                    Text(
                        '${DateFormat('yyyy-MM-dd').format(selected)}',
                      style: TextStyle(
                        fontSize: 18,color: Colors.white,
                      ) ,),
                    IconButton(onPressed: (){
                      setState(() {
                        DateTime nextDate = selected.add(Duration(days: 1));
                        selected = nextDate;
                      });
                    }, icon: Icon(Icons.arrow_forward, color: Colors.white,))
                  ],
                ),
              ),
            ),
            Expanded(child: SleepChart(
              selectedDate: selected,
            )),
          ],
        ),
      ),
    );
  }
}
