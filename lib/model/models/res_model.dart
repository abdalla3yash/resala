class ResModel {
  final bool _isSuccess;
  final Map _message;
  ResModel(this._isSuccess, this._message);

  Map get message => _message;
  bool get isSuccess => _isSuccess;
}
