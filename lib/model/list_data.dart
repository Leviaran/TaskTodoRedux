import 'data_model.dart';

/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

class ListData {
  static var empty = ListData(new List());

  final List<Data> data;

  ListData(this.data);

  ListData.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List)
            .map((i) => new Data.fromJson(i as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {'data': data};

  @override
  String toString() => "$data";
}
