 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../core/shared/customtextformfeild.dart';
import 'controller/todo_cubit.dart';

class Todofeilds extends StatelessWidget {
   Todofeilds({Key? key}) : super(key: key);
  TextEditingController datetextController=TextEditingController();
  TextEditingController timetextController=TextEditingController();
  TextEditingController titletextController=TextEditingController();
   TextEditingController statustextController=TextEditingController();
  String? titlevalue;
  @override
  Widget build(BuildContext context) {
    var todocubit=BlocProvider.of<TodoCubit>(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Custom_Textformfeild(
          textInputType: TextInputType.text,
          label_text:"title",
          icon: Icons.title,
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'title must not be empty';
            }
            return null;
          },
          onchaged: (value){
            titlevalue=value;
            titletextController.text=titlevalue!;
            todocubit.title=titletextController.text;
          },
        ),
        Custom_Textformfeild(
          textInputType: TextInputType.text,
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'status must not be empty';
            }
            return null;
          },
          label_text:"status",
          icon: Icons.subtitles,
          onchaged: (value){
            statustextController.text=value;
            todocubit.status=statustextController.text;
          },
        ),
        Custom_Textformfeild(
          textEditingController: timetextController,
          textInputType: TextInputType.datetime,
          onTap: (){
            showTimePicker(context: context,
                initialTime: TimeOfDay.now()).then((value) {
              timetextController.text=value!.format(context).toString();
              todocubit.time=timetextController.text;
            });
          },
          label_text:"time",
          icon: Icons.timelapse_rounded,
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'date must not be empty';
            }
            return null;
          },
        ),
        Custom_Textformfeild(
          textInputType: TextInputType.text,
          textEditingController: datetextController,
          icon: Icons.date_range_outlined,
          onTap: (){
            showDatePicker(context: context,
                initialDate: DateTime.now(), firstDate: DateTime.now(),
                lastDate: DateTime.parse('2023-12-12')).then((value){
              datetextController.text=DateFormat.yMMM().format(value!);
              todocubit.date=datetextController.text;
            });
          },
          label_text:"date",
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'time must not be empty';
            }
            return null;
          },
        ),
      ],);
  }
}
