import 'package:hive/hive.dart';
part 'FavoriteModel.g.dart';

@HiveType(typeId: 1)
class FavoriteModel{

  FavoriteModel({
    required this.type,
    required this.uuid,
  });

  @HiveField(0)
  final String type;

  @HiveField(1)
  final String uuid;
}