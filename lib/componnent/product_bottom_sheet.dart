import 'package:balanstate_test/componnent/custom_text_field.dart';
import 'package:balanstate_test/const/const.dart';
import 'package:flutter/material.dart';

class ProductBottomSheet extends StatefulWidget {
  const ProductBottomSheet({Key? key}) : super(key: key);

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}
class _ProductBottomSheetState extends State<ProductBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 1.7 + bottomInset,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
                children: [
                  _Product(),
                  _SaveButton(
                    onPressed: onSavePressed,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() async {
    // formKey는 생성을 했는데
    // Form 위젯과 결합을 안했을때
    if (formKey.currentState == null) {
      return print('결합안함');
    }

    if (formKey.currentState!.validate()) {
      print('에러가 없습니다.');
      formKey.currentState!.save();
      print(formKey);


      // print('key 값 : $key');
      Navigator.of(context).pop();
    } else {
      print('에러가 있습니다.');
    }
  }
}



class _Product extends StatelessWidget {

  const _Product({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text('Create product', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          // CustomTextField(
          //     label: 'Barcode',
          //     tf: true,
          //     unit: '',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'Product name',
          //   tf: false!,
          //   unit:'',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'gram',
          //   tf: true,
          //   unit:'g',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'Energy',
          //   tf: true,
          //   unit:'kcal',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'Carbohydrates',
          //   tf: true,
          //   unit:'g',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'Proteins',
          //   tf: true,
          //   unit:'g',
          // ),
          // SizedBox(height: 15,),
          // CustomTextField(
          //   label: 'Fat',
          //   tf: true,
          //   unit:'g',
          // ),
          // SizedBox(height: 30,),
        ],
      ),
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