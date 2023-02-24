import 'package:balanstate_test/componnent/calendar.dart';
import 'package:balanstate_test/componnent/meal.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 45, right: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 설정
                    _Setting(),
                    SizedBox(height: 37.0),
                    Column(
                      children: [
                        Text(
                          'Meal',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Calendar(
                      selectedDay: selectedDay,
                      focusedDay: focusedDay,
                      onDaySelected: onDaySelected,
                    ),
                    SizedBox(height: 40.0),

                    _Content(date: selectedDay,),

                    SizedBox(height: 37.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // 선택한 날짜로 변경
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
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
            Icons.home,
            color: Colors.white,
            size: 38,
          ),
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final DateTime date;
  const _Content({required this.date,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Meal(mealTime: 'Breakfast', date: date,),
        SizedBox(height: 15,),
        Meal(mealTime: 'Lunch',  date: date,),
        SizedBox(height: 15,),
        Meal(mealTime: 'Dinner',  date: date,),
      ],
    );
  }
}
