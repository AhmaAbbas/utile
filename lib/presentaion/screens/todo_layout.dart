import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/core/shared/customtextformfeild.dart';
import 'package:untitled/core/utls/styels.dart';
import 'package:untitled/presentaion/controller/todo_cubit.dart';
import 'package:untitled/presentaion/controller/todo_states.dart';
import 'package:untitled/presentaion/screens/tasks_screen.dart';

import '../../data/localdatabase_services/sqflite_services.dart';
import '../component.dart';
import 'archive_screen.dart';
import 'done_screen.dart';

class Todo_Layout extends StatelessWidget {

  var scaffoldkey=GlobalKey<ScaffoldState>();
  int curen=0;
  final formkey=GlobalKey<FormState>();
  List<Widget> screens=[Tasks_Screen(),Done_Screen(),Archive_Screen()];
  @override
  Widget build(BuildContext context) {
    var todocubit=BlocProvider.of<TodoCubit>(context);
    return BlocConsumer<TodoCubit,Todo_states>(
      listener:(context,state){
        if( state is Todo_InsertDataBase)
          {
            Navigator.pop(context);
            todocubit.changeicon(false);
          }
      },
      builder: (context,state){
        return  Scaffold(
          key: scaffoldkey,
          appBar: AppBar(title: Text(todocubit.apptitle[todocubit.currentindex],style:Styels.textStyle25,),),
          floatingActionButton: FloatingActionButton(
              onPressed: ()async{
                if(todocubit.isshow==false){
                  scaffoldkey.currentState!.showBottomSheet((context){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      child: Form(
                        key: formkey,
                        child:Todofeilds(),
                      ),
                    );
                  });
                  todocubit.changeicon(true);
                }
                else
                {
                  if(formkey.currentState!.validate()){
                    todocubit.inserttasks();
                    todocubit.getttasks();
                    //inserttodatabase(title:titletextController.text , date: datetextController.text, time: timetextController.text);
                    //Navigator.pop(context);


                    // task.getfromdatabase().then((value) {
                    //   print(value);
                    // });
                  }
                }

              },child: Icon(todocubit.icon)),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:todocubit.currentindex,
            onTap: (index){
              todocubit.changecurrentindex(index);
              //print(todocubit.currentindex);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu),label: "Tasks",),
              BottomNavigationBarItem(icon: Icon(Icons.check_box_outlined),label: "Done"),
              BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: "Archived"),
            ],
          ),
          body:screens[todocubit.currentindex] ,
        );
      },
    );
  }

}
