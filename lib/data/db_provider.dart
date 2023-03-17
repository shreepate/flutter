import 'package:demo/model/model.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const todo = 'courseList';
  static Database? _courseDb;
  static DataBaseHelper? _dataBaseHelper;

  DataBaseHelper._createInstance();

  String courseTable = 'course_table';
  String courseId = 'id';
  String coreSerial = 'core_serial';
  String status = 'status';
  String originalLaunch = 'original_launch';
  String details = 'details';


  static final DataBaseHelper db = DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    _dataBaseHelper ??= DataBaseHelper._createInstance();
    return _dataBaseHelper!;
  }

  Future<Database> get database async {
    _courseDb ??= await initializeDatabase();
    return _courseDb!;
  }

  Future<Database> initializeDatabase() async {
    String directory = await getDatabasesPath();
    String path = '$directory/course.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $courseTable($courseId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$coreSerial TEXT, $status TEXT,$originalLaunch TEXT,  $details TEXT'
            ')');
  }

  //FETCH TO GET ALL COURSE LIST
  Future<List<Map<String, dynamic>>> getAllCourseList() async {
    Database db = await database;
    var result = db.rawQuery("SELECT * FROM $courseTable");
    return result;
  }

  Future<int> createCourse(CourseDataModel data) async {
    Database db = await database;
    var result = await db.insert(courseTable, data.toJson());
    return result;
  }

  Future<List<CourseDataModel>> getCourseList() async {
    var courseList = await getAllCourseList();
    int count = courseList.length;
    List<CourseDataModel> noteList = <CourseDataModel>[];
    for (int index = 0; index < count; index++) {
      noteList.add(CourseDataModel.fromJson(courseList[index]));
    }
    return noteList;
  }

  Future<int> deleteAll() async {
    Database db = await DataBaseHelper().database;
    return await db.rawDelete("Delete from $courseTable");
  }
}

