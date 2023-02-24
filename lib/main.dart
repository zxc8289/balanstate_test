import 'package:balanstate_test/database/drift_database.dart';
import 'package:balanstate_test/screen/checkup_screen.dart';
import 'package:balanstate_test/screen/exercise_screen.dart';
import 'package:balanstate_test/screen/fitbit_screen.dart';
import 'package:balanstate_test/screen/heightpredresult_screen.dart';
import 'package:balanstate_test/screen/home_screen.dart';
import 'package:balanstate_test/screen/lomt_screen.dart';
import 'package:balanstate_test/screen/meal_screen.dart';
import 'package:balanstate_test/screen/recommend_screen.dart';
import 'package:balanstate_test/screen/setting_screen.dart';
import 'package:balanstate_test/screen/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

const Home_Route = '/';
const CheckUp_Route = '/Medical Checkup';
const Meal_Route = '/Meal';
const Exercise_Route = '/Exercise';
const Sleep_Route = '/Sleep';
const HeightPredResult_Route = '/Growth Predict';
const Fitbit_Route = '/FITBIT Link';
const Iomt_Route = '/IoMT';
const Recommend_Route = '/Personal Recommend';

void main() {

  final database = LocalDatabase();
  
  GetIt.I.registerSingleton<LocalDatabase>(database);
  runApp(
    MaterialApp(
      initialRoute: Home_Route,
      //home: HomeScreen(),
      routes: {
        Home_Route: (context) => HomeScreen(),
        CheckUp_Route: (context) => CheckUpScreen(),
        Meal_Route: (context) => MealScreen(),
        Exercise_Route: (context) => ExerciseScreen(),
        Sleep_Route: (context) => SleepScreen(),
        HeightPredResult_Route: (context) => HeightpredresultScreen(),
        Fitbit_Route: (context) => FitbitScreen(),
        Iomt_Route: (context) => LomtScreen(),
        Recommend_Route: (context) => RecommendScreen(),

      },
    ),
  );
}
