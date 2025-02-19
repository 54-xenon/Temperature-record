import 'package:flutter/material.dart';

// floatingactionbuttonがクリックされたときに、表示して体温を入力する
class BottomSheetAction extends StatelessWidget {
  const BottomSheetAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightGreen[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(top: 80),
      child: Center(
        child: Text("model bottom sheet"),
      ),
    );
  }
}