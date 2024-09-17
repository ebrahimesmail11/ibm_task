

import 'package:ibm_task/src/common/network/response_status.dart';

class ApiResponse<T> {

  ResponseStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);

  ApiResponse.initial(this.message) : status = ResponseStatus.INITIAL;

  ApiResponse.loading(this.message) : status = ResponseStatus.LOADING;

  ApiResponse.completed(this.data) : status = ResponseStatus.COMPLETED;

  ApiResponse.error(this.message) : status = ResponseStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}