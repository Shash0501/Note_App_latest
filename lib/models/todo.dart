import 'package:hive/hive.dart';

part 'todo.g.dart';

var date = new DateTime.now().toString();

var dateParse = DateTime.parse(date);

var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

@HiveType(typeId: 1)
class todos {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String date = formattedDate;
  @HiveField(3)
  late bool status = false;
  todos({required this.title, required this.description});
}
