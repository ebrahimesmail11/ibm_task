class LoginFailure {
  bool? status;
  String? message;
  dynamic  data;
  LoginFailure({
    this.status,
    this.message,
    this.data,
  });

  factory LoginFailure.fromJson(Map<String, dynamic> json) {
    return LoginFailure(
      status: json['status'],
      message: json['message'],
      data: json['data'] ,
    );
  }

  Map<String, dynamic> toJson()=> {
    'status': status,
    'message': message,
    'data': data,
  };
}
