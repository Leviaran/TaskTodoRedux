import 'package:redux_task_apps/redux/action.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_task_apps/model/list_data.dart';
import 'package:redux_task_apps/model/data_model.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

typedef OnStateChanged = Function(Data data);
typedef onRemoveIconClicked = Function(Data data);

class ListDataItem extends StatelessWidget {
  final Data data;
  ListDataItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(data.tugas),
        background: Container(
          color: Colors.blue,
        ), 
        onDismissed: (direction) {
          print("menghapus");
          new Container(
              color: Colors.black,
              child: new StoreConnector<ListData, OnStateChanged>(
                converter: (store) {
                  print("hapus");
                  return (item) => store.dispatch(RemoveItemAction(item));
                },
                builder: (context, callback) {
                  print("terhapus");
                  callback(Data(data.tugas, data.checked));
                  Text("${data.tugas} dihapus");
                  // Scaffold.of(context).showSnackBar(SnackBar(
                  //       content: Text("${data.tugas} dihapus"),
                  //     ));
                },
              ));
              
              

          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text("${data.tugas} dihapus")));
        },
        child: new ListTile(
          title: new Text(data.tugas),
          leading: new StoreConnector<ListData, OnStateChanged>(
            converter: (store) {
              return (item) => store.dispatch(ToogleItemStateAction(item));
            },
            builder: (context, callback) {
              return new Checkbox(
                value: data.checked,
                onChanged: (bool value) {
                  callback(Data(data.tugas, value));
                },
              );
            },
          ),
        ));
  }
}

class ListDataWidget extends StatelessWidget {
  //Build widget base state of store
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<ListData, List<Data>>(
      //Convert store into viewmodel hasilnya akan dimasukkan kedalam widget
      converter: (store) => store.state.data,
      builder: (context, list) {
        return new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => new ListDataItem(list[position]),
        );
      },
    );
  }
}
