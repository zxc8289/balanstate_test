import 'dart:async';

import 'package:balanstate_test/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool tf;
  final String unit;
  final String productingredients;
  final FormFieldSetter<String> onSaved;
  // final String initialValue;

  const CustomTextField({
    // required this.initialValue,
    required this.onSaved,
    required this.unit,
    required this.tf,
    required this.label,
    required this.productingredients,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print('productingredients = ${widget.productingredients}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        renderTextField(),
      ],
    );
  }

  // Text(
  Widget renderTextField() {
    return TextFormField(
      onSaved: widget.onSaved,
      // null이 return 되면 에러가 없다.
      // 에러가 있으면 에러를  String 값으로 리턴해준다.
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }
        return null;
      },
      controller: TextEditingController(text: widget.productingredients),
      cursorColor: Colors.grey,
      maxLines: widget.tf ? 1 : null,
      expands: false,
      // initialValue: widget.initialValue,
      maxLength: null,
      keyboardType: widget.tf
          ? TextInputType.number
          : TextInputType.multiline, // 키패드에 숫자만 뜨도록
      inputFormatters: widget.tf
          ? [
              FilteringTextInputFormatter.digitsOnly, // 숫자외에 입력이 들어와도 입력할수 없게
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true, // true가 되어야 색 변경 가능
        fillColor: Colors.grey[300],
        suffixText: widget.unit, // 텍스트에 붙음
      ),
    );
  }
}
