import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class SleepLog {
  final DateTime dateTime;
  final int level;

  SleepLog({required this.level, required this.dateTime});

  factory SleepLog.fromJson(Map<String, dynamic> json) {
    //final level = int.tryParse(json['level']); //level에 담겨있는 값이 string이기 때문에 int형으로 변환x
    final level = json['level'];
    int levelInt;
    if (level is int) {
      levelInt = level;
    } else if (level is String) {
      final levelMap = {'none': 0, 'deep': 1, 'light': 2, 'rem': 3, 'wake': 4};
      levelInt = levelMap[level] ?? -1;
    } else {
      throw FormatException('Invalid level : $level');
    }
    final dateTime = DateTime.parse(json['dateTime']);
    // if (level == null) {
    //   throw FormatException('Invalid level: ${json['level']}');
    // }
    return SleepLog(dateTime: dateTime, level: levelInt);
  }
}

class SleepChart extends StatefulWidget {
  final DateTime selectedDate;
  SleepChart({required this.selectedDate});

  @override
  _SleepChartState createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart> {
  List<SleepLog> _sleepLogs = [];
  bool _isLoading =
      false; //로딩 변수 설정(async에서 데이터를 다 받기 전에 build되는 것을 방지하기 위해 변수 설정해줌)

  @override
  void initState() {
    super.initState(); //딱 한번 실행됨
    print("initstate 실행");
    _fetchSleepLogs();
  }

  @protected
  void didUpdateWidget(SleepChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _fetchSleepLogs();
  }

  Future<void> _fetchSleepLogs() async {
    DateTime getDate = widget.selectedDate;

    setState(() {
      _isLoading = true;
    });
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzkyV0siLCJzdWIiOiJCRFlETlgiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJzZXQgcmFjdCBybG9jIHJ3ZWkgcmhyIHJudXQgcnBybyByc2xlIiwiZXhwIjoxNzA3MTk4NDkzLCJpYXQiOjE2NzU2NjI0OTN9.XaaNUEoChHFdtPYf0SHUEYyEvrYJLiotJCtlMgJLhnw';
      final response = await dio.get(
        // 'https://api.fitbit.com/1.2/user/-/sleep/list.json?beforeDate=${DateFormat('yyyy-MM-dd').format(DateTime.now())}&sort=desc&offset=0&limit=1',
        // 'https://api.fitbit.com/1.2/user/-/sleep/list.json?beforeDate=${DateFormat('yyyy-MM-dd').format(DateTime.now())}&sort=desc&offset=0&limit=5',
        'https://api.fitbit.com/1.2/user/-/sleep/list.json?beforeDate=${DateFormat('yyyy-MM-dd').format(getDate)}&sort=desc&offset=0&limit=1',
      );

      final List<dynamic> sleepData =
          response.data['sleep'][0]['levels']['data'];
      _sleepLogs = sleepData.map((data) => SleepLog.fromJson(data)).toList();
      print("sleepLogs는 ${_sleepLogs}");
      print(response);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build! sleep log ? : ${_sleepLogs}");
    print(widget.selectedDate);
    if (_isLoading) {
      //loding이 true면 로딩바 실행
      return CircularProgressIndicator(
        color: Colors.cyan,
        backgroundColor: Colors.teal,
      );
    } else if (_sleepLogs.isEmpty) {
      //loading은 false인데 _sleepLogs가 비어있으면 no data 출력
      return Text('No Data');
    } else {
      //loading false, _sleepLogs에 데이터가 있으면 실행
      final data = _sleepLogs.map((sleepLog) {
        return FlSpot(sleepLog.dateTime.millisecondsSinceEpoch.toDouble(),
            sleepLog.level.toDouble());
      }).toList();
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 20),
        child: Container(
          child: LineChart(
            LineChartData(
              minX: _sleepLogs.isEmpty ? 0 : data.first.x,
              maxX: _sleepLogs.isEmpty ? 0 : data.last.x,
              minY: 0,
              maxY: 5,
              borderData: FlBorderData(  show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  margin: 13,
                  reservedSize: 40,
                  interval: 1,
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'none';
                      case 1:
                        return 'deep';
                      case 2:
                        return 'light';
                      case 3:
                        return 'rem';
                      case 4:
                        return 'wake';
                      default:
                        return '';
                    }
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  margin: 13,
                  reservedSize: 22,
                  interval: 2 * 60 * 60 * 1000, // x축에 30분 간격으로 시간 출력
                  getTitles: (value) {
                    DateTime dateTime =
                        DateTime.fromMillisecondsSinceEpoch(value.toInt());
                    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _sleepLogs
                      .map((data) => FlSpot(
                          data.dateTime.millisecondsSinceEpoch.toDouble(),
                          data.level.toDouble()))
                      .toList(),
                  isCurved: true,
                  colors: [Colors.white],
                  barWidth: 2,
                  belowBarData: BarAreaData(
                    show: true,
                    gradientFrom: Offset(0, 0),
                    gradientTo: Offset(0, 1),
                    colors: [Colors.white.withOpacity(0.3), Colors.transparent],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
