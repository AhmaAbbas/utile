import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentaion/controller/todo_cubit.dart';
import 'package:untitled/presentaion/controller/todo_states.dart';

import '../../core/utls/styels.dart';

class Done_Screen extends StatelessWidget {
  const Done_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todocubit=BlocProvider.of<TodoCubit>(context);
    todocubit.getttasks();
    return BlocBuilder<TodoCubit,Todo_states>(
        builder: (context,state){
          if (state is Todo_Loadingdata)
          {
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return ListView.builder(
                itemCount:todocubit.donetasks.length,
                itemBuilder: (context,index){

                  return Card(
                    child: ListTile(
                      leading:CircleAvatar(
                          radius: 40,
                          child: Text(todocubit.donetasks[index]["title"],
                            style:Styels.textStyle25.copyWith(fontSize: 15),)) ,
                      title:Text(todocubit.donetasks[index]["date"]) ,
                      subtitle: Text(todocubit.donetasks[index]["status"]),
                      trailing: Text(todocubit.donetasks[index]["time"]),
                    ),
                  );
                });
          }
        }
    );
  }
}
