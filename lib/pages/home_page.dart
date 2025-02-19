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
              SizedBox(height: 100),
              Text("今日の体温"),
              Text("--.-"  "℃"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // ここにshowMModealBottomSheetを表示さいたい動作のコールバックに誠意等を記述していく
          await showModalBottomSheet<void> (
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            builder: (context) {
              return BottomSheetAction();
            }
          );
        },
      ),
    );
  }
}