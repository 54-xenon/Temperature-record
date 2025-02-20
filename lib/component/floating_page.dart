import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// floatingactionbuttonがクリックされたときに、表示して体温を入力する
class BottomSheetAction extends StatelessWidget {
  const BottomSheetAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
        child: Center(
          child: Column(
            children: [
              Text("体温を入力してください"),
              TextField(
                // 数字のみを入力できるように設定する
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // 線でボックスを囲む
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ここに入力してください",
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("OK"),
                    onPressed: () {
                      // TextFildの記入された時にDBに保存するメソッドを後で作る
                    },
                  ),
                  ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      // 元のページに戻る
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}