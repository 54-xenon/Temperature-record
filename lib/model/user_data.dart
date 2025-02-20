// Hiveのパッケージをインポートする
import 'package:hive/hive.dart';

// Entiry生成用
part 'user_data.g.dart';

// モデルごとの識別子の設定
@HiveType(typeId: 1)
class dateInfo {
  const dateInfo({
    this.date,
    this.tempDate,
  });
  @HiveField(0) 
  int date;
  @HiveField(1)
  double tempDate;
}