import 'Data.dart';

/// data : {"error":"Repository creation failed."}
/// code : 422

class Fourpiconeword {
  Fourpiconeword({
      Data data, 
      num code,}){
    _data = data;
    _code = code;
}

  Fourpiconeword.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _code = json['code'];
  }
  Data _data;
  num _code;
Fourpiconeword copyWith({  Data data,
  num code,
}) => Fourpiconeword(  data: data ?? _data,
  code: code ?? _code,
);
  Data get data => _data;
  num get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    map['code'] = _code;
    return map;
  }

}