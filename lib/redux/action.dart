import 'package:redux_task_apps/model/data_model.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

class AddTaskAction {
  final Data data;
  AddTaskAction(this.data);
}

class ToogleItemStateAction {
  final Data data;
  ToogleItemStateAction(this.data);
}

class FetchItemAction {
  final List<Data> list;
  FetchItemAction(this.list);
}

class LoadItemAction {}

class RemoveItemAction {
  final Data data;
  RemoveItemAction(this.data);
}
