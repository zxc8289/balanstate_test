import 'package:balanstate_test/componnent/menu_button.dart';
import 'package:balanstate_test/const/menu_button_name.dart';
import 'package:balanstate_test/const/menu_icon_name.dart';
import 'package:balanstate_test/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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

                    // 상단
                    _Header(),

                    // 메뉴 버튼
                    _Content(
                      menuButtonName: menuButtonName,
                      iconName: iconName,
                    ),
                  ],
                ),
              ),
            ],
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SettingScreen();
                },
              ),
            );
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white,
            size: 38,
          ),
        )
      ],
    );
  }
}

// 상단
class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "cheol choi's health score",
          style: TextStyle(
              fontSize: 26.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 27.0,
        ),
        Stack(
          children: [
            SvgPicture.asset(
              'asset/img/dashboard_en.svg',
              width: 400,
              height: 200,
            ),
            Center(
              child: Container(
                width: 150,
                height: 80,
                margin: const EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      100,
                    ),
                    topLeft: Radius.circular(100),
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 26),
                  child: Text(
                    'good',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
        RichText(
          text: TextSpan(
            text: 'Your current health score is ',
            style: TextStyle(fontSize: 17, color: Colors.white),
            children: const <TextSpan>[
              TextSpan(
                  text: 'good', style: TextStyle(fontWeight: FontWeight.bold)),
              // TextSpan(text: '입니다.'),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 25, top: 17, right: 10),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF5E8C9D),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'negative',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Text(
                    'keep',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 210,
                ),
                Container(
                  width: 110,
                  margin: const EdgeInsets.only(top: 11),
                  padding: const EdgeInsets.only(top: 11.5, bottom: 11.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(23.0),
                    color: Color(0xFF22C3B2),
                  ),
                  child: Center(
                    child: Text(
                      'positive',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// 메뉴 버튼
class _Content extends StatelessWidget {
  final List<String> menuButtonName;
  final List<Icon> iconName;
  const _Content({
    required this.iconName,
    required this.menuButtonName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < menuButtonName.length; i++)
          MenuButton(
            menuButtonName: menuButtonName[i],
            iconName: iconName[i],
          ),
      ],
    );
  }
}
