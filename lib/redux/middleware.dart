import 'dart:async';
import 'dart:convert';

import 'package:redux_task_apps/model/list_data.dart';
import 'action.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

const String APP_STATE_KEY = "APP_STATE";

void storeDataItemMiddleware(
    Store<ListData> task, action, NextDispatcher next) {
  next(action);

  if (action is AddTaskAction ||
      action is ToogleItemStateAction ||
      action is RemoveItemAction) {
    saveStateToPref(task.state);
  }

  if (action is LoadItemAction) {
    loadStateFromPref().then((state) {
      task.dispatch(new FetchItemAction(state.data));
    });
  }
}

void saveStateToPref(ListData data) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var stateString = json.encode(data.toJson());
  await sharedPreferences.setString(APP_STATE_KEY, stateString);
}

Future<ListData> loadStateFromPref() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var stateString = sharedPreferences.getString(APP_STATE_KEY);
  Map stateMap = json.decode(stateString);
  return new ListData.fromJson(stateMap);
}
