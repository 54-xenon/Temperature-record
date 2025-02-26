import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:temperaurerecordapp/model/temperature_data.dart';
import 'package:temperaurerecordapp/pages/home_page.dart';

void main() async {
  // なんかわからんけど呪文
  // フレームワークとFlutterエンジンを結びつけるためのものらしい
  // runAppの前に初期化する必要なるフレームワークや機能を使用する場合に使うらしい。とりあえず、DB関係に場合は書いた方がよさそう
  WidgetsFlutterBinding.ensureInitialized();
  // Hiveを初期化する
  await Hive.initFlutter();
  // モデルクラスを登録(Adapterは自動生成)
  Hive.registerAdapter(TemperatureDataAdapter());
  // boxインスタンスを取得する
  await Hive.openBox<TemperatureData>('temperatureBox');
  // アプリの起動
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "体温トラッカー",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.lightGreen,
        ),
      ),
      home: HomePage(),
    );
  }
}