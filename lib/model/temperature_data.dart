import 'package:hive/hive.dart';

part 'temperature_data.g.dart'; // 自動生成されるファイル

@HiveType(typeId: 0) // typeId はデータごとに一意のIDを設定
class TemperatureData {
  @HiveField(0)
  // 日時と時間
  DateTime date;

  @HiveField(1)
  // 記録する体温
  double temperature;
  // コンストラクタ
  TemperatureData(this.date, this.temperature);
}
