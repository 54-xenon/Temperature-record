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
  final TextEditingController _controller = TextEditingController();
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
                controller: _controller,
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
                      // 入力した数値をHibeのDBに保存する
                      final text = _controller.text.trim();
                      if (text.isNotEmpty) {
                        final temp = double.tryParse(text);
                        if (temp != null) {
                          Navigator.pop(context, temp);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("体温を入力しください")),
                          );
                        }
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
