/// error : "Repository creation failed."

class Data {
  Data({
      String error,}){
    _error = error;
}

  Data.fromJson(dynamic json) {
    _error = json['error'];
  }
  String _error;
Data copyWith({  String error,
}) => Data(  error: error ?? _error,
);
  String get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    return map;
  }

}