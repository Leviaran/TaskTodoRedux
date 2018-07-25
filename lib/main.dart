import 'package:flutter/material.dart';
import 'util/all_library.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

void main() => runApp(new TodoMain());

class TodoMain extends StatelessWidget {
  final store = new DevToolsStore<ListData>(listDataReducer,
      initialState: ListData.empty, middleware: [storeDataItemMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ListData>(
        store: store,
        child: new MaterialApp(
          title: 'TodoList',
          theme: new ThemeData(primarySwatch: Colors.blue),
          home: new StoreBuilder<ListData>(
            onInit: (store) => store.dispatch(new LoadItemAction()),
            builder: (context, store) => new DataTodo(),
          ),
        ));
  }
}

class DataTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingTask("Add new task", new Icon(Icons.add));
  }
}
