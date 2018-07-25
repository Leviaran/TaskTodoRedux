/**
 * Created by ran on 6/12/18.
 * Email in randy.arba@gmail.com
 * Github in https://github.com/Leviaran
 * Publication in https://medium.com/@randy.arba
 */

class Data {
  String tugas;
  bool checked;

  Data(this.tugas, this.checked);

  Data.fromJson(Map<String, dynamic> json)
      : tugas = json['tugas'],
        checked = json['checked'];

  Map<String, dynamic> toJson() => {'tugas': tugas, 'checked': checked};

  @override
  String toString() {
    return "$tugas: $checked";
  }
}
