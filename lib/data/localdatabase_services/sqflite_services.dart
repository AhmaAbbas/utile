
import 'package:sqflite/sqflite.dart';
abstract class base_localdataSource{
  void inserttodatabase({required title,required date,required time,required status});
  Future getfromdatabase();
  void update_tasks({required String status,required int id});
  void deletefromtasks({required int id});
}
class Localdatabse_services extends base_localdataSource{

  final databse =openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db,ver)  {
        db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
        ).then((value){
          print("database created");
        }).catchError((error){
          print("error==== ${error.toString()}");
        });
      },
      onOpen: (Database db){
        print("database opened");
      });
  void inserttodatabase({required title,required date,required time,required status })async{
    final db=await databse;
    await db.transaction((txn)async{
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "$status")'
      ).then((value){
        print("$value data inserted");
      }).catchError((error){
        print("error when inserted==== ${error.toString()}");
      });
    });

  }
  Future getfromdatabase()async{
    final db=await databse;
    return  await db.rawQuery('SELECT * FROM tasks');

  }
  void update_tasks({required String status,required int id})async{
    final db=await databse;
    await db.rawUpdate(
        'UPDATE Test SET status = ?  WHERE id = ?',['$status',id]);
  }
  void deletefromtasks({required int id})async{
    final db=await databse;
    await db.rawUpdate(
        'DELETE FROM tasks WHERE id = ?',[id]);
  }

}