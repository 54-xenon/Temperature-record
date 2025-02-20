import 'dart:async';
import 'package:flutter/material.dart';
import 'package:temperaurerecordapp/component/floating_page.dart';
import 'package:temperaurerecordapp/pages/history_page.dart';
import 'package:temperaurerecordapp/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("体温を記録"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // 履歴のページに飛ぶ
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // さっき入力した値が表示される
              SizedBox(height: 20),
              Text(
                "今日の体温",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 15),
              Text(
                "--.-"  "℃",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          // ここにshowMModealBottomSheetを表示さいたい動作のコールバックに誠意等を記述していく
          await showModalBottomSheet<void> (
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            // ModelBottomSheetの下にあるbodyに対してのぼかし
            barrierColor: Colors.black.withValues(alpha: 0.2), 
            elevation: 1,
            builder: (context) {
              return DraggableScrollableSheet(
                initialChildSize: 0.5, //初期の高さ(50%)
                minChildSize: 0.3, //最初の高さ(30%)
                maxChildSize: 1.0, //最大の高さ(100%)
                expand: false,
                builder: (context, scrollController) {
                  return BottomSheetAction();
                },
              );
            }
          );
        },
        // childはwidgetの最後に記述しないと怒られる
        child: Icon(Icons.add),
      ),
    );
  }
}