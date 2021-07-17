import 'package:hive/hive.dart';

part 'todo_completed.g.dart';

var date = new DateTime.now().toString();

var dateParse = DateTime.parse(date);

var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

@HiveType(typeId: 2)
class todos_completed {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String date = formattedDate;
  @HiveField(3)
  late bool status = false;
  todos_completed({required this.title, required this.description});
}
