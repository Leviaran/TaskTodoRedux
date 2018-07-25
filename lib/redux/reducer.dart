import 'package:redux_task_apps/model/list_data.dart';
import 'package:redux_task_apps/model/data_model.dart';
import 'action.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

ListData listDataReducer(ListData stateList, dynamic action) {
  if (action is AddTaskAction) {
    return addItem(stateList.data, action);
  } else if (action is ToogleItemStateAction) {
    return toogleItemState(stateList.data, action);
  } else if (action is RemoveItemAction) {
    return removeItem(stateList.data, action);
  } else if (action is FetchItemAction) {
    return loadItem(action);
  }
  return stateList;
}

ListData addItem(List<Data> data, AddTaskAction action) {
  return new ListData(List.from(data)..add(action.data));
}

ListData toogleItemState(List<Data> data, ToogleItemStateAction action) {
  return new ListData(data
      .map((item) => item.tugas == action.data.tugas ? action.data : item)
      .toList());
}

ListData removeItem(List<Data> data, RemoveItemAction action) {
  return new ListData(
      List.from(data)..removeWhere((item) => item.tugas == action.data.tugas));
}

ListData loadItem(FetchItemAction action) {
  return new ListData(action.list);
}
