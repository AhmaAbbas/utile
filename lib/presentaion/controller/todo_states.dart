class Todo_states{}
class TodoInitialStates extends Todo_states{}
class Todo_CreateDataBase extends Todo_states{}
class Todo_Changecurrent_index extends Todo_states{}
class Todo_ChangeIcon extends Todo_states{}
class Todo_InsertDataBase extends Todo_states{}
class Todo_Failed_InsertDataBase extends Todo_states{
  String error;
  Todo_Failed_InsertDataBase({required this.error});
}
class Todo_Loadingdata extends Todo_states{}
class Todo_GetDataBase extends Todo_states{}
class Todo_UpdateDataBase extends Todo_states{}
class Todo_DeleteDataBase extends Todo_states{}
