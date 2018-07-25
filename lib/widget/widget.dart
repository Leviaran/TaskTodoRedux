import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_task_apps/model/list_data.dart';
import 'package:redux_task_apps/model/data_model.dart';
import 'package:redux_task_apps/redux/action.dart';
import 'package:redux_task_apps/widget/list.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

/**
 * Create Floating with notch
 */
class FloatingTask extends StatelessWidget {
  String label;
  Icon icon;

  FloatingTask(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();
    return new Scaffold(
        appBar: AppBar(title: new Text(label)),
        body: new ListDataWidget(),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 3.0,
          icon: icon,
          label: new Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => new AddItemBottomSheet());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: new PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: new Container(
              height: 55.0,
              child: BottomAppBar(
                hasNotch: false,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )));
  }
}

/**
 * Membuat Bottomsheet yang memiliki textfield 
 */
typedef OnAddCallback = Function(String dataTugas);

class AddItemBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<ListData, OnAddCallback>(
      converter: (store) {
        return (dataTugas) =>
            store.dispatch(AddTaskAction(Data(dataTugas, false)));
      },
      builder: (context, callback) {
        return new AddItemBottomSheetWidget(callback);
      },
    );
  }
}

class AddItemBottomSheetWidget extends StatefulWidget {
  final OnAddCallback callback;

  AddItemBottomSheetWidget(this.callback);

  @override
  State<StatefulWidget> createState() => new AddItemBottomSheetState(callback);
}

class AddItemBottomSheetState extends State<AddItemBottomSheetWidget> {
  String dataTugas;

  final OnAddCallback callback;
  final myController = TextEditingController();

  //New Code
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  AddItemBottomSheetState(this.callback);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    autofocus: true,
                    controller: myController,
                    decoration: new InputDecoration(
                        labelText: 'Tugas', hintText: 'contoh koding'),
                    //lost
                  ),
                )
              ],
            ),
            new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      // dataTugas = myController.text;
                      callback(myController.text);
                    });
                    Navigator.pop(context);
                    // callback(dataTugas);
                  },
                  child: new Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ));
  }

  // _handleTextChanged(String newStringData) {
  //   print(dataTugas);
  //   setState(() {
  //     dataTugas = newStringData;
  //   });
  // }
}
