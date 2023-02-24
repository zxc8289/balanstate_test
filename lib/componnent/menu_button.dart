import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String menuButtonName;
  final Icon iconName;
  const MenuButton({
    required this.iconName,
    required this.menuButtonName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: () {
          print(menuButtonName);
          Navigator.of(context).pushNamed(
            '/${menuButtonName}',
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                iconName,
                SizedBox(
                  width: 10,
                ),
                Text(
                  menuButtonName,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );

    //   OutlinedButton.icon(
    //   onPressed: () {
    //       print(menuButtonName);
    //       Navigator.of(context).pushNamed(
    //         '/${menuButtonName}',
    //       );
    //   },
    //   icon: Icon(
    //     Icons.home,
    //     size: 30,
    //   ),
    //   label: Text(menuButtonName, textAlign: TextAlign.left,),
    // );
  }
}
