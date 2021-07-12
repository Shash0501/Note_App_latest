import 'package:hive/hive.dart';

part 'note.g.dart';

var date = new DateTime.now().toString();

var dateParse = DateTime.parse(date);

var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

@HiveType(typeId: 0)
class notes {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String date = formattedDate;
  notes({required this.title, required this.description});
}
