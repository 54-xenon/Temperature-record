import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:temperaurerecordapp/component/floating_page.dart';
import 'package:temperaurerecordapp/model/temperature_data.dart';
import 'package:temperaurerecordapp/pages/history_page.dart';
import 'package:temperaurerecordapp/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<TemperatureData> temperatureBox;
  @override
  void initState() {
    super.initState();
    temperatureBox = Hive.box<TemperatureData>('temperatureBox');
  }
  // 今までonPressedの中にあったShoeModediaglgを関数に分ける
  void _shoeInputDialog() async {
    double? temperature = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      // 背景のブラーで、witthopacitiyはバージョンアップで非推奨になった
      barrierColor: Colors.black.withValues(alpha: 0.2),
      elevation: 1,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, // 最初の高さ
          minChildSize: 0.3, // 最大の高さ
          maxChildSize: 1.0, // 最小の高さ
          expand: false,
          builder: (context, scrollController) {
            return BottomSheetAction(); // TextFildとかの画面を表示する
          },
        );
      },
    );
    if (temperature != null) {
      _addTemperature(temperature);
    }
  }
  // 温度データを’Hibeに保存する
  void _addTemperature(double temp) {
    // データを取得して変数に記録(日付と体温)
    final newTemperature = TemperatureData(DateTime.now(), temp);
    // Boxに新しいデータを保存する
    temperatureBox.add(newTemperature);
    // 画面を更新
    setState(() {});
  }

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
        // BottomSheetの表示をコールバック
        onPressed: _shoeInputDialog,
        // childはwidgetの最後に記述しないと怒られる
        child: Icon(Icons.add),
      ),
    );
  }
}