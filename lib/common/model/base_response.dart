/// 父类返回
class BaseResponse<T> {
  int errorCode;
  String errorMsg;
  T data;

  BaseResponse(this.errorCode, this.errorMsg, this.data);

  BaseResponse.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMsg = json['errorMsg'],
        data = json['data'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"errorCode\":$errorCode");
    sb.write(",\"errorMsg\":\"$errorMsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
