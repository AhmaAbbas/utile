

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentaion/controller/todo_states.dart';

import '../../data/localdatabase_services/sqflite_services.dart';

class TodoCubit extends Cubit<Todo_states>{
  Localdatabse_services task=Localdatabse_services();
  int currentindex=0;
  void changecurrentindex(int index){
    currentindex=index;
    emit(Todo_Changecurrent_index());
    //getttasks();
  }
  bool isshow=false;
  IconData icon=Icons.add;
  void changeicon(bool is_show){
    isshow=is_show;
    icon=isshow?Icons.add:Icons.edit;
    emit(Todo_ChangeIcon());
    getttasks();
  }
  String? title,date,time,status;
  List newtasks=[];
  List donetasks=[];
  List archivedtasks=[];
  List<String> apptitle=[
    "Tasks",
    "Done",
    "Archive"
  ];

  TodoCubit():super(TodoInitialStates());
  void createdatabase(){
    task.databse;
    emit(Todo_CreateDataBase());
  }
  void inserttasks(){
   try{
     task.inserttodatabase(title: title!, date: date!, time: time!,status:status!);
     emit(Todo_InsertDataBase());
     //getttasks();
   }catch(err){
     emit(Todo_Failed_InsertDataBase(error:err.toString()));
   }

  }
  void getttasks(){
    emit(Todo_Loadingdata());
     newtasks=[];
     donetasks=[];
     archivedtasks=[];
    task.getfromdatabase().then((value) {
      //print(value);
      value.forEach((element){
        if(element['status'] == 'New'||element['status'] == 'new'){
          newtasks.add(element);
        }
        else  if(element['status'] == 'good'||element['status'] == 'done'){
          donetasks.add(element);
        }
        else{
          archivedtasks.add(element);
        }
      });
      emit(Todo_GetDataBase());
    });
  }
  void updatetasks({required String status,required int id}){
     task.update_tasks(status: status, id: id);
    getttasks();
    emit(Todo_UpdateDataBase());
  }
  void deletetasks({required int id}){
    task.deletefromtasks(id: id);
    getttasks();
    emit(Todo_DeleteDataBase());
  }

}