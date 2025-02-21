import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// floatingactionbuttonがクリックされたときに、表示して体温を入力する
class BottomSheetAction extends StatefulWidget {
  const BottomSheetAction({super.key});

  @override
  State<BottomSheetAction> createState() => _BottomSheetActionState();
}

class _BottomSheetActionState extends State<BottomSheetAction> {
  //
  TextEditingController _controller = TextEditingController();
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
                // その画面を開くと自動的にキーボードが表示されて、入力できるようになる
                autofocus: true,
                // 数字のみを入力できるように設定する
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
                ],
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
                      // TextFildから数字を取得する
                      double? temperature = double.tryParse(_controller.text);
                      // 取得した値をhomepageに返す
                      if (temperature != null) {
                        // 戻り値を返す
                        Navigator.pop(context, temperature);
                      }
                    },
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      // 元のページに戻る
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
